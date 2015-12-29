class Sighting < ActiveRecord::Base
  belongs_to :user
  belongs_to :bus
end
