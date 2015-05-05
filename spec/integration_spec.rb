#   As a user, I want to see a welcome page that includes where I can go and what I can do.
#   As a user, I want to see all of the lists that I have created so that I can manage them one at a time.
#   As a user, I want to create new lists of different categories so that I can keep similar tasks together (phone calls, school work, house work, errands to run, bills to pay, etc)
#   As a user, I want to select a single list and see the tasks for it.
#   As a user, I want to add tasks to a list.

require('capybara/rspec')
require('./app')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the path to the welcome page', {:type => :feature}) do
  it('displays the welcome page') do
    visit('/')
    expect(page).to(have_content('WELCOME TO THE TO-DO APP'))
  end
end

describe('viewing all lists', {:type => :feature}) do
  it('displays all lists') do
    visit('/')
    click_button('All Lists')
    expect(page).to have_content('ALL LISTS')
  end
end

describe('creating new list', {:type => :feature}) do
  it('displays a form and a button that when submitted displays a newly added list') do
    visit('/')
    click_button('All Lists')
    fill_in('list_description', :with => 'school')
    click_button('Create List')
    expect(page).to have_content('school')
  end
end

describe('seeing details tasks for a single list', {:type => :feature}) do
  it('allows a user to click a list to see the tasks in that list') do
    visit('/')
    test_list = List.new({:description => "school", :id => nil})
    test_list.save()
    click_button('All Lists')
    click_link(test_list.id().to_s())
    expect(page).to have_content("school tasks:")
  end
end

describe('creating a new task', {:type => :feature}) do
  it('displays a form and button that when submitted displays a newly added task') do
    visit('/')
    test_list = List.new({:description => "school", :id => nil})
    test_list.save()
    click_button('All Lists')
    click_link(test_list.id().to_s())
    fill_in('task_description', :with => 'learn Sinatra')
    fill_in('due_date', :with => '2015-05-07')
    click_button('Create Task')
    expect(page).to have_content('learn Sinatra')
  end
end
