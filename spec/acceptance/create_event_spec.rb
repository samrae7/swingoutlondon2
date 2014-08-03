require 'rails_helper'

def given_the_user_is_on_the_new_event_form

end

feature "adding an event", type: :feature do
  let(:event) { Fabricate.build(:event) }
  scenario "User creates an event with a url" do
    when_i_create_a_new_event_with_valid_data
    then_the_event_should_be_displayed
  end

  scenario "User creates an event with invalid data" do
    when_i_create_an_event_with_invalid_data
    then_errors_should_be_displayed
  end

  def when_i_create_a_new_event_with_valid_data
    visit '/events/new'
    within("#new_event") do
      fill_in 'event[url]', with: event.url
      select 'Intermittent', from: "event[frequency]"
      fill_in 'event[date]', with: event.date

      click_button 'Create event'
    end
  end

  def then_the_event_should_be_displayed
    expect(page).to have_content "New event created"
    expect(page).to have_content event.url
  end

  def when_i_create_an_event_with_invalid_data
    visit '/events/new'
    within("#new_event") do
      fill_in 'event[url]', with: "foo"
      fill_in 'event[date]', with: "3333/01/4/27"

      click_button 'Create event'
    end
  end

  def then_errors_should_be_displayed
    expect(page).to have_content "errors prevented this event from being saved"
    expect(page).to have_content "can't be blank" # Supposed to match on the Frequency field
    expect(page).to have_content "must be a valid URL" # Supposed to match on the Url field
    expect(page).to have_content "must be before" # Supposed to match on the date field
  end
end

feature "adding a weekly event", type: :feature do
  before { Timecop.freeze(Date.new(2001, 1, 1)) }
  after { Timecop.return }
  let(:event) { Fabricate.build(:event) }
  scenario "User creates events for the next 4 weeks in the future" do
    when_i_create_a_weekly_repeating_event
    then_events_for_the_next_4_weeks_should_be_displayed
    and_events_for_the_next_4_weeks_should_be_displayed_in_the_events_list
  end

  def when_i_create_a_weekly_repeating_event
    visit '/events/new'
    within("#new_event") do
      fill_in 'event[url]', with: event.url
      select 'Weekly', from: "event[frequency]"
      fill_in 'event[date]', with: Date.new(2001, 1, 3)

      click_button 'Create event'
    end
  end
  def then_events_for_the_next_4_weeks_should_be_displayed
    expect(page).to have_content "New event created"
    expect(page).to have_content "4 instances created"
    display_4_events
  end

  def and_events_for_the_next_4_weeks_should_be_displayed_in_the_events_list
    visit '/events'
    expect(page).to have_content(event.url, count: 4)
    display_4_events
  end

  def display_4_events
    expect(page).to have_content "2001-01-03"
    expect(page).to have_content "2001-01-10"
    expect(page).to have_content "2001-01-17"
    expect(page).to have_content "2001-01-24"
  end
end