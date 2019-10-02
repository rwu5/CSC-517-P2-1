require 'test_helper'

class StudentCurrentBorrowListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student_current_borrow_list = student_current_borrow_lists(:one)
  end

  test "should get index" do
    get student_current_borrow_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_student_current_borrow_list_url
    assert_response :success
  end

  test "should create student_current_borrow_list" do
    assert_difference('StudentCurrentBorrowList.count') do
      post student_current_borrow_lists_url, params: { student_current_borrow_list: { book_id: @student_current_borrow_list.book_id, student_id: @student_current_borrow_list.student_id } }
    end

    assert_redirected_to student_current_borrow_list_url(StudentCurrentBorrowList.last)
  end

  test "should show student_current_borrow_list" do
    get student_current_borrow_list_url(@student_current_borrow_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_current_borrow_list_url(@student_current_borrow_list)
    assert_response :success
  end

  test "should update student_current_borrow_list" do
    patch student_current_borrow_list_url(@student_current_borrow_list), params: { student_current_borrow_list: { book_id: @student_current_borrow_list.book_id, student_id: @student_current_borrow_list.student_id } }
    assert_redirected_to student_current_borrow_list_url(@student_current_borrow_list)
  end

  test "should destroy student_current_borrow_list" do
    assert_difference('StudentCurrentBorrowList.count', -1) do
      delete student_current_borrow_list_url(@student_current_borrow_list)
    end

    assert_redirected_to student_current_borrow_lists_url
  end
end
