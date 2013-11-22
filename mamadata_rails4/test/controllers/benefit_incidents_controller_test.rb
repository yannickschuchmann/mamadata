require 'test_helper'

class BenefitIncidentsControllerTest < ActionController::TestCase
  setup do
    @benefit_incident = benefit_incidents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:benefit_incidents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create benefit_incident" do
    assert_difference('BenefitIncident.count') do
      post :create, benefit_incident: { amount: @benefit_incident.amount, program_benefit_relationship_id: @benefit_incident.program_benefit_relationship_id, remark: @benefit_incident.remark, user_id: @benefit_incident.user_id }
    end

    assert_redirected_to benefit_incident_path(assigns(:benefit_incident))
  end

  test "should show benefit_incident" do
    get :show, id: @benefit_incident
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @benefit_incident
    assert_response :success
  end

  test "should update benefit_incident" do
    patch :update, id: @benefit_incident, benefit_incident: { amount: @benefit_incident.amount, program_benefit_relationship_id: @benefit_incident.program_benefit_relationship_id, remark: @benefit_incident.remark, user_id: @benefit_incident.user_id }
    assert_redirected_to benefit_incident_path(assigns(:benefit_incident))
  end

  test "should destroy benefit_incident" do
    assert_difference('BenefitIncident.count', -1) do
      delete :destroy, id: @benefit_incident
    end

    assert_redirected_to benefit_incidents_path
  end
end
