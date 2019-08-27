require 'test_helper'

class AllSeeingEyesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @all_seeing_eye = all_seeing_eyes(:one)
  end

  test "should get index" do
    get all_seeing_eyes_url
    assert_response :success
  end

  test "should get new" do
    get new_all_seeing_eye_url
    assert_response :success
  end

  test "should create all_seeing_eye" do
    assert_difference('AllSeeingEye.count') do
      post all_seeing_eyes_url, params: { all_seeing_eye: { ip: @all_seeing_eye.ip, message: @all_seeing_eye.message } }
    end

    assert_redirected_to all_seeing_eye_url(AllSeeingEye.last)
  end

  test "should show all_seeing_eye" do
    get all_seeing_eye_url(@all_seeing_eye)
    assert_response :success
  end

  test "should get edit" do
    get edit_all_seeing_eye_url(@all_seeing_eye)
    assert_response :success
  end

  test "should update all_seeing_eye" do
    patch all_seeing_eye_url(@all_seeing_eye), params: { all_seeing_eye: { ip: @all_seeing_eye.ip, message: @all_seeing_eye.message } }
    assert_redirected_to all_seeing_eye_url(@all_seeing_eye)
  end

  test "should destroy all_seeing_eye" do
    assert_difference('AllSeeingEye.count', -1) do
      delete all_seeing_eye_url(@all_seeing_eye)
    end

    assert_redirected_to all_seeing_eyes_url
  end
end
