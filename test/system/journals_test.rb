require "application_system_test_case"

class JournalsTest < ApplicationSystemTestCase
  setup do
    @journal = journals(:one)
  end

  test "visiting the index" do
    visit journals_url
    assert_selector "h1", text: "Journals"
  end

  test "should create journal" do
    visit journals_url
    click_on "New journal"

    fill_in "Calories", with: @journal.calories
    fill_in "Date", with: @journal.date
    fill_in "Entry", with: @journal.entry
    check "Gym attendance" if @journal.gym_attendance
    fill_in "Gym duration", with: @journal.gym_duration
    fill_in "Gym type", with: @journal.gym_type
    fill_in "Water", with: @journal.water
    fill_in "Weight", with: @journal.weight
    click_on "Create Journal"

    assert_text "Journal was successfully created"
    click_on "Back"
  end

  test "should update Journal" do
    visit journal_url(@journal)
    click_on "Edit this journal", match: :first

    fill_in "Calories", with: @journal.calories
    fill_in "Date", with: @journal.date
    fill_in "Entry", with: @journal.entry
    check "Gym attendance" if @journal.gym_attendance
    fill_in "Gym duration", with: @journal.gym_duration
    fill_in "Gym type", with: @journal.gym_type
    fill_in "Water", with: @journal.water
    fill_in "Weight", with: @journal.weight
    click_on "Update Journal"

    assert_text "Journal was successfully updated"
    click_on "Back"
  end

  test "should destroy Journal" do
    visit journal_url(@journal)
    click_on "Destroy this journal", match: :first

    assert_text "Journal was successfully destroyed"
  end
end
