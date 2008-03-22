class Channel < ActiveRecord::Base
  has_many :triggers
end
