require 'test_helper'

class RecruitsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get recruits_index_url
    assert_response :success
  end

  test "should get show" do
    get recruits_show_url
    assert_response :success
  end

  test "should get new" do
    get recruits_new_url
    assert_response :success
  end

  test "should get create" do
    get recruits_create_url
    assert_response :success
  end

  test "should get destroy" do
    get recruits_destroy_url
    assert_response :success
  end

  test "should get edit" do
    get recruits_edit_url
    assert_response :success
  end

  test "should get update" do
    get recruits_update_url
    assert_response :success
  end

end
