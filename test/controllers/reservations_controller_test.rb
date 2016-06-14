require "test_helper"

class ReservationsControllerTest < ActionController::TestCase
  test 'can get index' do
    get :index
    assert_response 200
    assert_not_nil assigns(:reservations)
  end

  test 'can post create' do
    assert_difference 'Reservation.count' do
      post :create, reservation: attributes_for(:reservation)
      assert_response 302
    end
  end
end