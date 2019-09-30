require "application_system_test_case"

class BorrowHistoriesTest < ApplicationSystemTestCase
  setup do
    @borrow_history = borrow_histories(:one)
  end

  test "visiting the index" do
    visit borrow_histories_url
    assert_selector "h1", text: "Borrow Histories"
  end

  test "creating a Borrow history" do
    visit borrow_histories_url
    click_on "New Borrow History"

    fill_in "Book", with: @borrow_history.book_id
    fill_in "Library", with: @borrow_history.library_id
    fill_in "Student", with: @borrow_history.student_id
    click_on "Create Borrow history"

    assert_text "Borrow history was successfully created"
    click_on "Back"
  end

  test "updating a Borrow history" do
    visit borrow_histories_url
    click_on "Edit", match: :first

    fill_in "Book", with: @borrow_history.book_id
    fill_in "Library", with: @borrow_history.library_id
    fill_in "Student", with: @borrow_history.student_id
    click_on "Update Borrow history"

    assert_text "Borrow history was successfully updated"
    click_on "Back"
  end

  test "destroying a Borrow history" do
    visit borrow_histories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Borrow history was successfully destroyed"
  end
end
