require 'test_helper'

class PaldemicFilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @paldemic_file = paldemic_files(:one)
  end

  test "should get index" do
    get paldemic_files_url
    assert_response :success
  end

  test "should get new" do
    get new_paldemic_file_url
    assert_response :success
  end

  test "should create paldemic_file" do
    assert_difference('PaldemicFile.count') do
      post paldemic_files_url, params: { paldemic_file: { author: @paldemic_file.author, name: @paldemic_file.name, num_downloads: @paldemic_file.num_downloads, num_downvotes: @paldemic_file.num_downvotes, num_upvotes: @paldemic_file.num_upvotes } }
    end

    assert_redirected_to paldemic_file_url(PaldemicFile.last)
  end

  test "should show paldemic_file" do
    get paldemic_file_url(@paldemic_file)
    assert_response :success
  end

  test "should get edit" do
    get edit_paldemic_file_url(@paldemic_file)
    assert_response :success
  end

  test "should update paldemic_file" do
    patch paldemic_file_url(@paldemic_file), params: { paldemic_file: { author: @paldemic_file.author, name: @paldemic_file.name, num_downloads: @paldemic_file.num_downloads, num_downvotes: @paldemic_file.num_downvotes, num_upvotes: @paldemic_file.num_upvotes } }
    assert_redirected_to paldemic_file_url(@paldemic_file)
  end

  test "should destroy paldemic_file" do
    assert_difference('PaldemicFile.count', -1) do
      delete paldemic_file_url(@paldemic_file)
    end

    assert_redirected_to paldemic_files_url
  end
end
