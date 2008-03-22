class Admin < ActiveRecord::Base
  attr_accessor :password
  has_many :triggers
  has_and_belongs_to_many :channels
  
  # validation 
  validates_length_of		:email,		:within => 3..100 
  validates_uniqueness_of	:email,		:case_sensitive => false 
  validates_presence_of		:name,		:global,
  										:login
  validates_length_of		:password,	:within => 4..40, 
										:if => :password_required? 
  validates_confirmation_of :password,	:if => :password_required? 
  
  # callbacks
  before_save :encrypt_password
  
  # md5 a password
  def self.encrypt(pass)
    Digest::MD5.hexdigest(pass)
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
