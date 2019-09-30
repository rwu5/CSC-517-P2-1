require "application_system_test_case"

class LibraryBookListsTest < ApplicationSystemTestCase
  setup do
    @library_book_list = library_book_lists(:one)
  end

  test "visiting the index" do
    visit library_book_lists_url
    assert_selector "h1", text: "Library Book Lists"
  end

  test "creating a Library book list" do
    visit library_book_lists_url
    click_on "New Library Book List"

    fill_in "Book", with: @library_book_list.book_id
    fill_in "Library", with: @library_book_list.library_id
    fill_in "Number", with: @library_book_list.number
    click_on "Create Library book list"

    assert_text "Library book list was successfully created"
    click_on "Back"
  end

  test "updating a Library book list" do
    visit library_book_lists_url
    click_on "Edit", match: :first

    fill_in "Book", with: @library_book_list.book_id
    fill_in "Library", with: @library_book_list.library_id
    fill_in "Number", with: @library_book_list.number
    click_on "Update Library book list"

    assert_text "Library book list was successfully updated"
    click_on "Back"
  end

  test "destroying a Library book list" do
    visit library_book_lists_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Library book list was successfully destroyed"
  end
end
