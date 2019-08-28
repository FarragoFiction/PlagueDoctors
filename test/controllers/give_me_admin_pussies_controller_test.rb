require 'test_helper'

class GiveMeAdminPussiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @give_me_admin_pussy = give_me_admin_pussies(:one)
  end

  test "should get index" do
    get give_me_admin_pussies_url
    assert_response :success
  end

  test "should get new" do
    get new_give_me_admin_pussy_url
    assert_response :success
  end

  test "should create give_me_admin_pussy" do
    assert_difference('GiveMeAdminPussy.count') do
      post give_me_admin_pussies_url, params: { give_me_admin_pussy: { demand: @give_me_admin_pussy.demand } }
    end

    assert_redirected_to give_me_admin_pussy_url(GiveMeAdminPussy.last)
  end

  test "should show give_me_admin_pussy" do
    get give_me_admin_pussy_url(@give_me_admin_pussy)
    assert_response :success
  end

  test "should get edit" do
    get edit_give_me_admin_pussy_url(@give_me_admin_pussy)
    assert_response :success
  end

  test "should update give_me_admin_pussy" do
    patch give_me_admin_pussy_url(@give_me_admin_pussy), params: { give_me_admin_pussy: { demand: @give_me_admin_pussy.demand } }
    assert_redirected_to give_me_admin_pussy_url(@give_me_admin_pussy)
  end

  test "should destroy give_me_admin_pussy" do
    assert_difference('GiveMeAdminPussy.count', -1) do
      delete give_me_admin_pussy_url(@give_me_admin_pussy)
    end

    assert_redirected_to give_me_admin_pussies_url
  end
end
