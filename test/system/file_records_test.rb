require "application_system_test_case"

class FileRecordsTest < ApplicationSystemTestCase
  setup do
    @file_record = file_records(:one)
  end

  test "visiting the index" do
    visit file_records_url
    assert_selector "h1", text: "File Records"
  end

  test "creating a File record" do
    visit file_records_url
    click_on "New File Record"

    fill_in "File", with: @file_record.file
    fill_in "Name", with: @file_record.name
    click_on "Create File record"

    assert_text "File record was successfully created"
    click_on "Back"
  end

  test "updating a File record" do
    visit file_records_url
    click_on "Edit", match: :first

    fill_in "File", with: @file_record.file
    fill_in "Name", with: @file_record.name
    click_on "Update File record"

    assert_text "File record was successfully updated"
    click_on "Back"
  end

  test "destroying a File record" do
    visit file_records_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "File record was successfully destroyed"
  end
end
