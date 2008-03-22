class Admin < ActiveRecord::Base
  has_many :triggers
  has_and_belongs_to_many :channels
  
  validates_presence_of :login, :hashed_password, :global
end
