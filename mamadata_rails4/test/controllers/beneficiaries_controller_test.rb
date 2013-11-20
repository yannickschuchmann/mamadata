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
      post :create, beneficiary: { godfather_id: @beneficiary.godfather_id, narrative_text: @beneficiary.narrative_text, program_id: @beneficiary.program_id, school_class: @beneficiary.school_class, school_language: @beneficiary.school_language, school_name: @beneficiary.school_name, school_type: @beneficiary.school_type, status: @beneficiary.status }
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
    patch :update, id: @beneficiary, beneficiary: { godfather_id: @beneficiary.godfather_id, narrative_text: @beneficiary.narrative_text, program_id: @beneficiary.program_id, school_class: @beneficiary.school_class, school_language: @beneficiary.school_language, school_name: @beneficiary.school_name, school_type: @beneficiary.school_type, status: @beneficiary.status }
    assert_redirected_to beneficiary_path(assigns(:beneficiary))
  end

  test "should destroy beneficiary" do
    assert_difference('Beneficiary.count', -1) do
      delete :destroy, id: @beneficiary
    end

    assert_redirected_to beneficiaries_path
  end
end
