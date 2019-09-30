require 'test_helper'

class HoldListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hold_list = hold_lists(:one)
  end

  test "should get index" do
    get hold_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_hold_list_url
    assert_response :success
  end

  test "should create hold_list" do
    assert_difference('HoldList.count') do
      post hold_lists_url, params: { hold_list: { book_id: @hold_list.book_id, library_id: @hold_list.library_id, student_id: @hold_list.student_id } }
    end

    assert_redirected_to hold_list_url(HoldList.last)
  end

  test "should show hold_list" do
    get hold_list_url(@hold_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_hold_list_url(@hold_list)
    assert_response :success
  end

  test "should update hold_list" do
    patch hold_list_url(@hold_list), params: { hold_list: { book_id: @hold_list.book_id, library_id: @hold_list.library_id, student_id: @hold_list.student_id } }
    assert_redirected_to hold_list_url(@hold_list)
  end

  test "should destroy hold_list" do
    assert_difference('HoldList.count', -1) do
      delete hold_list_url(@hold_list)
    end

    assert_redirected_to hold_lists_url
  end
end
