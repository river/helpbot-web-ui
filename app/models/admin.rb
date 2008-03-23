require "digest/md5"

class Admin < ActiveRecord::Base
  attr_accessor :password
  has_many :triggers
  has_and_belongs_to_many :channels
  
  # validation 
  validates_length_of	  	:email,     :within => 3..100 
  validates_uniqueness_of	:email,	  	:case_sensitive => false 
  validates_presence_of		:name,	  	:login
  validates_length_of	  	:password,	:within => 4..40, 
										      :if =>      :password_required? 
  validates_confirmation_of :password,	:if => :password_required? 
  
  # callbacks
  before_save :encrypt_password
  
  # authenticate by email/password 
  def self.authenticate(login, pass) 
    admin = find_by_login(login) 
    admin && admin.authenticated?(pass) ? admin : nil 
  end
  
  # does the given password match the stored encrypted password 
  def authenticated?(pass) 
    hashed_password == Admin.encrypt(pass) 
  end

  # sha1 a password
  def self.encrypt(pass)
    Digest::MD5.hexdigest(pass)
  end
  
  # list all channels an admin admins
  def admin_of
    self.channels.each do |chan|
      return chan.name
    end
  end
  
  # returns longest name possible
  def longest_name
    self.name ? self.name : self.login
  end
  
  
  protected
    # encrypt a users password
    def encrypt_password
      return if password.blank?
      self.hashed_password = Admin.encrypt(password)
    end
  
    # no encrypted password yet OR password attribute is set 
    def password_required? 
      hashed_password.blank? || !password.blank?
    end
end
