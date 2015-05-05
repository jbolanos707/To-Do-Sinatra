#   As a user, I want to see a welcome page that includes where I can go and what I can do.
#   As a user, I want to see all of the lists that I have created so that I can manage them one at a time.
#   As a user, I want to create new lists of different categories so that I can keep similar tasks together (phone calls, school work, house work, errands to run, bills to pay, etc)
#   As a user, I want to select a single list and see the tasks for it.
#   As a user, I want to add tasks to a list.

require('spec_helper')
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the path to the welcome page', {:type => :feature}) do
  it('displays the welcome page') do
    visit('/')
    expect(page).to have_content('WELCOME TO THE TO-DO APP')
  end
end

describe('viewing all lists', {:type => :feature}) do
  it('displays all lists') do
    visit('/')
    click_button('All Lists')
    expect(page).to have_content('ALL LISTS')
  end
end
