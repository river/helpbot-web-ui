class Trigger < ActiveRecord::Base
  belongs_to :channel
  belongs_to :admin
end
