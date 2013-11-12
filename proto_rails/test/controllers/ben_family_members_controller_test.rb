require 'test_helper'

class BenFamilyMembersControllerTest < ActionController::TestCase
  setup do
    @ben_family_member = ben_family_members(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ben_family_members)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ben_family_member" do
    assert_difference('BenFamilyMember.count') do
      post :create, ben_family_member: { beneficiary: @ben_family_member.beneficiary, date_of_birth: @ben_family_member.date_of_birth, income: @ben_family_member.income, name: @ben_family_member.name, profession: @ben_family_member.profession, relation: @ben_family_member.relation, status: @ben_family_member.status, surname: @ben_family_member.surname }
    end

    assert_redirected_to ben_family_member_path(assigns(:ben_family_member))
  end

  test "should show ben_family_member" do
    get :show, id: @ben_family_member
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ben_family_member
    assert_response :success
  end

  test "should update ben_family_member" do
    patch :update, id: @ben_family_member, ben_family_member: { beneficiary: @ben_family_member.beneficiary, date_of_birth: @ben_family_member.date_of_birth, income: @ben_family_member.income, name: @ben_family_member.name, profession: @ben_family_member.profession, relation: @ben_family_member.relation, status: @ben_family_member.status, surname: @ben_family_member.surname }
    assert_redirected_to ben_family_member_path(assigns(:ben_family_member))
  end

  test "should destroy ben_family_member" do
    assert_difference('BenFamilyMember.count', -1) do
      delete :destroy, id: @ben_family_member
    end

    assert_redirected_to ben_family_members_path
  end
end
