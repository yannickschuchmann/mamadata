require 'test_helper'

class CommunityDevelopmentsControllerTest < ActionController::TestCase
  setup do
    @community_development = community_developments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:community_developments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create community_development" do
    assert_difference('CommunityDevelopment.count') do
      post :create, community_development: { any_savings: @community_development.any_savings, debts: @community_development.debts, earning_members_of_family: @community_development.earning_members_of_family, electricity: @community_development.electricity, family_children_vaccined: @community_development.family_children_vaccined, family_chronic_deseases: @community_development.family_chronic_deseases, family_chronic_deseases_which: @community_development.family_chronic_deseases_which, family_disabled: @community_development.family_disabled, family_dropout_present_condition: @community_development.family_dropout_present_condition, family_dropout_reason_for: @community_development.family_dropout_reason_for, family_knowledge_of_family_planning: @community_development.family_knowledge_of_family_planning, family_members_addicted_to: @community_development.family_members_addicted_to, family_members_addicted_who: @community_development.family_members_addicted_who, family_school_dropout: @community_development.family_school_dropout, family_skilled_in_art: @community_development.family_skilled_in_art, family_type_of_handicap: @community_development.family_type_of_handicap, family_undergone_family_planning: @community_development.family_undergone_family_planning, head_of_household: @community_development.head_of_household, home_remedies_for_illnesses: @community_development.home_remedies_for_illnesses, house_posession: @community_development.house_posession, house_type: @community_development.house_type, illness_treatment: @community_development.illness_treatment, land_details: @community_development.land_details, mode_of_savings: @community_development.mode_of_savings, rain_harvesting: @community_development.rain_harvesting, reason_for_debt: @community_development.reason_for_debt, residental_status: @community_development.residental_status, source_of_income: @community_development.source_of_income, toilet_facility: @community_development.toilet_facility, type_of_family: @community_development.type_of_family, want_rain_harvesting: @community_development.want_rain_harvesting, water_from: @community_development.water_from }
    end

    assert_redirected_to community_development_path(assigns(:community_development))
  end

  test "should show community_development" do
    get :show, id: @community_development
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @community_development
    assert_response :success
  end

  test "should update community_development" do
    patch :update, id: @community_development, community_development: { any_savings: @community_development.any_savings, debts: @community_development.debts, earning_members_of_family: @community_development.earning_members_of_family, electricity: @community_development.electricity, family_children_vaccined: @community_development.family_children_vaccined, family_chronic_deseases: @community_development.family_chronic_deseases, family_chronic_deseases_which: @community_development.family_chronic_deseases_which, family_disabled: @community_development.family_disabled, family_dropout_present_condition: @community_development.family_dropout_present_condition, family_dropout_reason_for: @community_development.family_dropout_reason_for, family_knowledge_of_family_planning: @community_development.family_knowledge_of_family_planning, family_members_addicted_to: @community_development.family_members_addicted_to, family_members_addicted_who: @community_development.family_members_addicted_who, family_school_dropout: @community_development.family_school_dropout, family_skilled_in_art: @community_development.family_skilled_in_art, family_type_of_handicap: @community_development.family_type_of_handicap, family_undergone_family_planning: @community_development.family_undergone_family_planning, head_of_household: @community_development.head_of_household, home_remedies_for_illnesses: @community_development.home_remedies_for_illnesses, house_posession: @community_development.house_posession, house_type: @community_development.house_type, illness_treatment: @community_development.illness_treatment, land_details: @community_development.land_details, mode_of_savings: @community_development.mode_of_savings, rain_harvesting: @community_development.rain_harvesting, reason_for_debt: @community_development.reason_for_debt, residental_status: @community_development.residental_status, source_of_income: @community_development.source_of_income, toilet_facility: @community_development.toilet_facility, type_of_family: @community_development.type_of_family, want_rain_harvesting: @community_development.want_rain_harvesting, water_from: @community_development.water_from }
    assert_redirected_to community_development_path(assigns(:community_development))
  end

  test "should destroy community_development" do
    assert_difference('CommunityDevelopment.count', -1) do
      delete :destroy, id: @community_development
    end

    assert_redirected_to community_developments_path
  end
end
