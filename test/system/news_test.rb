require "application_system_test_case"

class NewsTest < ApplicationSystemTestCase
  setup do
    @news = news(:one)
  end

  test "visiting the index" do
    visit news_url
    assert_selector "h1", text: "News"
  end

  test "creating a New" do
    visit news_url
    click_on "New New"

    fill_in "Body", with: @news.body
    fill_in "Product", with: @news.product_id
    fill_in "Title", with: @news.title
    click_on "Create New"

    assert_text "New was successfully created"
    click_on "Back"
  end

  test "updating a New" do
    visit news_url
    click_on "Edit", match: :first

    fill_in "Body", with: @news.body
    fill_in "Product", with: @news.product_id
    fill_in "Title", with: @news.title
    click_on "Update New"

    assert_text "New was successfully updated"
    click_on "Back"
  end

  test "destroying a New" do
    visit news_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "New was successfully destroyed"
  end
end
