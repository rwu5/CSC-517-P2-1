require 'test_helper'

class LibraryBookListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @library_book_list = library_book_lists(:one)
  end

  test "should get index" do
    get library_book_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_library_book_list_url
    assert_response :success
  end

  test "should create library_book_list" do
    assert_difference('LibraryBookList.count') do
      post library_book_lists_url, params: { library_book_list: { book_id: @library_book_list.book_id, library_id: @library_book_list.library_id, number: @library_book_list.number } }
    end

    assert_redirected_to library_book_list_url(LibraryBookList.last)
  end

  test "should show library_book_list" do
    get library_book_list_url(@library_book_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_library_book_list_url(@library_book_list)
    assert_response :success
  end

  test "should update library_book_list" do
    patch library_book_list_url(@library_book_list), params: { library_book_list: { book_id: @library_book_list.book_id, library_id: @library_book_list.library_id, number: @library_book_list.number } }
    assert_redirected_to library_book_list_url(@library_book_list)
  end

  test "should destroy library_book_list" do
    assert_difference('LibraryBookList.count', -1) do
      delete library_book_list_url(@library_book_list)
    end

    assert_redirected_to library_book_lists_url
  end
end
