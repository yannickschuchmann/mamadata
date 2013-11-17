require 'test_helper'

class PeopleControllerTest < ActionController::TestCase
  setup do
    @person = people(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:people)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create person" do
    assert_difference('Person.count') do
      post :create, person: { caste: @person.caste, city: @person.city, date_of_birth: @person.date_of_birth, education: @person.education, fathers_name: @person.fathers_name, gender: @person.gender, health_condition: @person.health_condition, income: @person.income, marital_status: @person.marital_status, name: @person.name, name_of_the_house: @person.name_of_the_house, name_of_the_street: @person.name_of_the_street, native_place: @person.native_place, number_of_the_house: @person.number_of_the_house, occupation: @person.occupation, pin_code: @person.pin_code, place_of_birth: @person.place_of_birth, religion: @person.religion, role_id: @person.role_id }
    end

    assert_redirected_to person_path(assigns(:person))
  end

  test "should show person" do
    get :show, id: @person
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @person
    assert_response :success
  end

  test "should update person" do
    patch :update, id: @person, person: { caste: @person.caste, city: @person.city, date_of_birth: @person.date_of_birth, education: @person.education, fathers_name: @person.fathers_name, gender: @person.gender, health_condition: @person.health_condition, income: @person.income, marital_status: @person.marital_status, name: @person.name, name_of_the_house: @person.name_of_the_house, name_of_the_street: @person.name_of_the_street, native_place: @person.native_place, number_of_the_house: @person.number_of_the_house, occupation: @person.occupation, pin_code: @person.pin_code, place_of_birth: @person.place_of_birth, religion: @person.religion, role_id: @person.role_id }
    assert_redirected_to person_path(assigns(:person))
  end

  test "should destroy person" do
    assert_difference('Person.count', -1) do
      delete :destroy, id: @person
    end

    assert_redirected_to people_path
  end
end
