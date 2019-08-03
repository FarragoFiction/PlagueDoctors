require 'test_helper'

class TombstoneTimeholdsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tombstone_timehold = tombstone_timeholds(:one)
  end

  test "should get index" do
    get tombstone_timeholds_url
    assert_response :success
  end

  test "should get new" do
    get new_tombstone_timehold_url
    assert_response :success
  end

  test "should create tombstone_timehold" do
    assert_difference('TombstoneTimehold.count') do
      post tombstone_timeholds_url, params: { tombstone_timehold: { permanent: @tombstone_timehold.permanent, tombstoneJSON: @tombstone_timehold.tombstoneJSON } }
    end

    assert_redirected_to tombstone_timehold_url(TombstoneTimehold.last)
  end

  test "should show tombstone_timehold" do
    get tombstone_timehold_url(@tombstone_timehold)
    assert_response :success
  end

  test "should get edit" do
    get edit_tombstone_timehold_url(@tombstone_timehold)
    assert_response :success
  end

  test "should update tombstone_timehold" do
    patch tombstone_timehold_url(@tombstone_timehold), params: { tombstone_timehold: { permanent: @tombstone_timehold.permanent, tombstoneJSON: @tombstone_timehold.tombstoneJSON } }
    assert_redirected_to tombstone_timehold_url(@tombstone_timehold)
  end

  test "should destroy tombstone_timehold" do
    assert_difference('TombstoneTimehold.count', -1) do
      delete tombstone_timehold_url(@tombstone_timehold)
    end

    assert_redirected_to tombstone_timeholds_url
  end
end
