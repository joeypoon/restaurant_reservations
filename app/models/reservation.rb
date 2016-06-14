class Reservation < ActiveRecord::Base
  validates :name, :time, presence: true
end
