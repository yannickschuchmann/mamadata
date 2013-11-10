require 'test_helper'

class BeneficiariesControllerTest < ActionController::TestCase
  setup do
    @beneficiary = beneficiaries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:beneficiaries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create beneficiary" do
    assert_difference('Beneficiary.count') do
      post :create, beneficiary: { city: @beneficiary.city, date_of_birth: @beneficiary.date_of_birth, fathers_name: @beneficiary.fathers_name, gender: @beneficiary.gender, house_name: @beneficiary.house_name, house_number: @beneficiary.house_number, name: @beneficiary.name, native_place: @beneficiary.native_place, pin_code: @beneficiary.pin_code, place_of_birth: @beneficiary.place_of_birth, street_name: @beneficiary.street_name }
    end

    assert_redirected_to beneficiary_path(assigns(:beneficiary))
  end

  test "should show beneficiary" do
    get :show, id: @beneficiary
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @beneficiary
    assert_response :success
  end

  test "should update beneficiary" do
    patch :update, id: @beneficiary, beneficiary: { city: @beneficiary.city, date_of_birth: @beneficiary.date_of_birth, fathers_name: @beneficiary.fathers_name, gender: @beneficiary.gender, house_name: @beneficiary.house_name, house_number: @beneficiary.house_number, name: @beneficiary.name, native_place: @beneficiary.native_place, pin_code: @beneficiary.pin_code, place_of_birth: @beneficiary.place_of_birth, street_name: @beneficiary.street_name }
    assert_redirected_to beneficiary_path(assigns(:beneficiary))
  end

  test "should destroy beneficiary" do
    assert_difference('Beneficiary.count', -1) do
      delete :destroy, id: @beneficiary
    end

    assert_redirected_to beneficiaries_path
  end
end
