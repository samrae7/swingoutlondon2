require 'rails_helper'

RSpec.feature "Admin schedules a break", type: :feature do

  before do
    user = Fabricate.create(:user)
    login_as(user, scope: :user)
  end

  scenario 'in a weekly event' do
    given_an_existing_weekly_repeating_event
    when_i_schedule_an_ending
    then_the_period_is_shown_as_ended
    when_i_schedule_a_new_period
    then_a_new_period_is_shown_as_starting
  end

  def given_an_existing_weekly_repeating_event
    generator = Fabricate.build(:event_generator, frequency: 1, start_date: Faker::Date.backward)
    generator.save(validate: false)
    @event = generator.event
  end

  def when_i_schedule_an_ending
    visit "events/#{@event.to_param}"

    click_link end_period_link
    @end_date = Date.today + 7
    fill_in end_date_field,     with: @end_date
    click_button 'Submit' # TODO: use a better name!
  end

  def then_the_period_is_shown_as_ended
    expect(page).to have_text "Ended: #{@end_date.to_s}"
    expect(page).to_not have_link(end_period_link)
  end

  def when_i_schedule_a_new_period
    @start_date = Date.today + 56

    click_link 'New period'
    fill_in start_date_field,   with: @start_date
    select 'Weekly', from: frequency_select
    click_button 'Submit' # TODO: use a better name!
  end

  def then_a_new_period_is_shown_as_starting
    expect(page).to have_text "Started: #{@start_date.to_s}"
  end


  def end_date_field
    "event_generator[end_date]"
  end

  def start_date_field
    "event_generator[start_date]"
  end

  def frequency_select
    "event_generator[frequency]"
  end

  def end_period_link
    'End period'
  end
end
