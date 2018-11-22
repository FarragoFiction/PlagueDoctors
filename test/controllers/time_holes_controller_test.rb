require 'test_helper'

class TimeHolesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @time_hole = time_holes(:one)
  end

  test "should get index" do
    get time_holes_url
    assert_response :success
  end

  test "should get new" do
    get new_time_hole_url
    assert_response :success
  end

  test "should create time_hole" do
    assert_difference('TimeHole.count') do
      post time_holes_url, params: { time_hole: { permanent: @time_hole.permanent, wigglerJSON: @time_hole.wigglerJSON } }
    end

    assert_redirected_to time_hole_url(TimeHole.last)
  end

  test "should show time_hole" do
    get time_hole_url(@time_hole)
    assert_response :success
  end

  test "should get edit" do
    get edit_time_hole_url(@time_hole)
    assert_response :success
  end

  test "should update time_hole" do
    patch time_hole_url(@time_hole), params: { time_hole: { permanent: @time_hole.permanent, wigglerJSON: @time_hole.wigglerJSON } }
    assert_redirected_to time_hole_url(@time_hole)
  end

  test "should destroy time_hole" do
    assert_difference('TimeHole.count', -1) do
      delete time_hole_url(@time_hole)
    end

    assert_redirected_to time_holes_url
  end
end
