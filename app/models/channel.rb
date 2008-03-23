class Channel < ActiveRecord::Base
  has_many :triggers
  has_and_belongs_to_many :admins
  
  validates_presence_of :name
  
  def all_admins
    globals = Admin.find_by_global(true)
    globals = [globals] unless globals.is_a? Array
    (self.admins.find(:all) + globals).sort!
  end
end
