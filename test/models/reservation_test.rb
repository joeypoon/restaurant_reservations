require 'test_helper'

class ReservationTest < ActiveSupport::TestCase
  test 'factory is valid' do
    reservation = build_stubbed :reservation
    assert reservation.valid?
  end

  test 'validates presence of name' do
    reservation = build_stubbed :reservation, name: nil
    assert_not reservation.valid?
  end

  test 'validates presence of time' do
    reservation = build_stubbed :reservation, time: nil
    assert_not reservation.valid?
  end

  test 'active scope gets correct reservations' do
    good_reservation = create :reservation
    bad_reservation = create :reservation, time: 2.hours.ago
    assert Reservation.active.include?(good_reservation)
    assert_not Reservation.active.include?(bad_reservation)
  end

  test 'validates max capacity' do
    time = Time.now
    Reservation.MAX_CAPACITY.times do
      create :reservation, time: time
    end
    reservation = build_stubbed :reservation, time: time
    assert_not reservation.valid?
    assert Reservation.last.hour_block.count <= Reservation.MAX_CAPACITY
  end
end