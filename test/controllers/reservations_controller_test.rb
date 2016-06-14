require "test_helper"

class ReservationsControllerTest < ActionController::TestCase
  test 'can get index' do
    get :index
    assert_response 200
    assert_not_nil assigns(:reservations)
  end
end