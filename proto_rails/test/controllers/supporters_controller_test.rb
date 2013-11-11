require 'test_helper'

class SupportersControllerTest < ActionController::TestCase
  setup do
    @supporter = supporters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:supporters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create supporter" do
    assert_difference('Supporter.count') do
      post :create, supporter: { city: @supporter.city, date_of_birth: @supporter.date_of_birth, fathers_name: @supporter.fathers_name, gender: @supporter.gender, godfather: @supporter.godfather, name: @supporter.name, name_of_street: @supporter.name_of_street, name_of_the_house: @supporter.name_of_the_house, native_place: @supporter.native_place, place_of_birth: @supporter.place_of_birth, zipcode: @supporter.zipcode }
    end

    assert_redirected_to supporter_path(assigns(:supporter))
  end

  test "should show supporter" do
    get :show, id: @supporter
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @supporter
    assert_response :success
  end

  test "should update supporter" do
    patch :update, id: @supporter, supporter: { city: @supporter.city, date_of_birth: @supporter.date_of_birth, fathers_name: @supporter.fathers_name, gender: @supporter.gender, godfather: @supporter.godfather, name: @supporter.name, name_of_street: @supporter.name_of_street, name_of_the_house: @supporter.name_of_the_house, native_place: @supporter.native_place, place_of_birth: @supporter.place_of_birth, zipcode: @supporter.zipcode }
    assert_redirected_to supporter_path(assigns(:supporter))
  end

  test "should destroy supporter" do
    assert_difference('Supporter.count', -1) do
      delete :destroy, id: @supporter
    end

    assert_redirected_to supporters_path
  end
end
