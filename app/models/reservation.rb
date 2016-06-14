class Reservation < ActiveRecord::Base
  validates :name, :time, presence: true
  validate :at_capacity?
  scope :active, -> { where("time > ?", 1.hour.ago) }

  def self.MAX_CAPACITY
    8
  end

  def hour_block
    Reservation.where("time = ?", self.time)
  end

  private

    def at_capacity?
      unless hour_block.count <= Reservation.MAX_CAPACITY
        errors.add(:capacity, "Max capacity reached")
      end
    end
end
