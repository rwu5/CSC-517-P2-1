require "application_system_test_case"

class HoldListsTest < ApplicationSystemTestCase
  setup do
    @hold_list = hold_lists(:one)
  end

  test "visiting the index" do
    visit hold_lists_url
    assert_selector "h1", text: "Hold Lists"
  end

  test "creating a Hold list" do
    visit hold_lists_url
    click_on "New Hold List"

    fill_in "Book", with: @hold_list.book_id
    fill_in "Library", with: @hold_list.library_id
    fill_in "Student", with: @hold_list.student_id
    click_on "Create Hold list"

    assert_text "Hold list was successfully created"
    click_on "Back"
  end

  test "updating a Hold list" do
    visit hold_lists_url
    click_on "Edit", match: :first

    fill_in "Book", with: @hold_list.book_id
    fill_in "Library", with: @hold_list.library_id
    fill_in "Student", with: @hold_list.student_id
    click_on "Update Hold list"

    assert_text "Hold list was successfully updated"
    click_on "Back"
  end

  test "destroying a Hold list" do
    visit hold_lists_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Hold list was successfully destroyed"
  end
end
