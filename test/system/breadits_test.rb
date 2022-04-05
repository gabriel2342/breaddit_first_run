require "application_system_test_case"

class BreaditsTest < ApplicationSystemTestCase
    setup do 
      @loaf = loafs(:first)
    end
  
  
  test "Creating a new loaf" do
    visit breadits_path
    assert_selector "h1", text: "Breadit"
  
    click_on "New Loaf"
    assert_selector "h1", text: "New Loaf"
  
    fill_in "body text", with: "Capybara post"
    click_on "Create Loaf"

    assert_selector "h1", text: "Loafs"
    assert_text "Capybara post"
  end

  test "Showing a loaf" do
     visit breadits_path
     click_link @loaf.name

     assert_selector "h1", text: @loaf.name
  end

  test "Edit a loaf" do
    visit breadits_path
    assert_selector "h1", text: "Breadit"

    click_on "Edit", match: :first
    assert_selector "h1", text: "Edit loaf"

    fill_in "body_text", with: "Updated loaf"
    click_on "Update loaf"
  end

  test "Destroying a loaf" do 
    visit breadits_path 
    assert_text @loaf.name

    click_on "Delete", match: :first
    assert_no_text @loaf.name
  end
end
