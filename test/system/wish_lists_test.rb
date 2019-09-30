require "application_system_test_case"

class WishListsTest < ApplicationSystemTestCase
  setup do
    @wish_list = wish_lists(:one)
  end

  test "visiting the index" do
    visit wish_lists_url
    assert_selector "h1", text: "Wish Lists"
  end

  test "creating a Wish list" do
    visit wish_lists_url
    click_on "New Wish List"

    fill_in "Book", with: @wish_list.book_id
    fill_in "Student", with: @wish_list.student_id
    click_on "Create Wish list"

    assert_text "Wish list was successfully created"
    click_on "Back"
  end

  test "updating a Wish list" do
    visit wish_lists_url
    click_on "Edit", match: :first

    fill_in "Book", with: @wish_list.book_id
    fill_in "Student", with: @wish_list.student_id
    click_on "Update Wish list"

    assert_text "Wish list was successfully updated"
    click_on "Back"
  end

  test "destroying a Wish list" do
    visit wish_lists_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Wish list was successfully destroyed"
  end
end
