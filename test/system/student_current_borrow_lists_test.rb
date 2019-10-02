require "application_system_test_case"

class StudentCurrentBorrowListsTest < ApplicationSystemTestCase
  setup do
    @student_current_borrow_list = student_current_borrow_lists(:one)
  end

  test "visiting the index" do
    visit student_current_borrow_lists_url
    assert_selector "h1", text: "Student Current Borrow Lists"
  end

  test "creating a Student current borrow list" do
    visit student_current_borrow_lists_url
    click_on "New Student Current Borrow List"

    fill_in "Book", with: @student_current_borrow_list.book_id
    fill_in "Student", with: @student_current_borrow_list.student_id
    click_on "Create Student current borrow list"

    assert_text "Student current borrow list was successfully created"
    click_on "Back"
  end

  test "updating a Student current borrow list" do
    visit student_current_borrow_lists_url
    click_on "Edit", match: :first

    fill_in "Book", with: @student_current_borrow_list.book_id
    fill_in "Student", with: @student_current_borrow_list.student_id
    click_on "Update Student current borrow list"

    assert_text "Student current borrow list was successfully updated"
    click_on "Back"
  end

  test "destroying a Student current borrow list" do
    visit student_current_borrow_lists_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Student current borrow list was successfully destroyed"
  end
end
