class Reservation < ActiveRecord::Base
  validates :name, :time, presence: true
  scope :active, -> { where("time > ?", 1.hour.ago) }
end
