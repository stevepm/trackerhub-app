require 'spec_helper'
require 'faraday'

feature 'Show pivotal tracker projects' do
  scenario 'user can view page with all projects' do
    visit '/'
    click_link "View Projects"
    expect(page).to have_content "App Review"
    expect(page).to have_content "Salary Survey"
  end

  scenario 'User can see stories per project' do
    visit '/'
    click_link "View Projects"
    click_on 'Magelowitz and King TrackerHub'
    expect(page).to have_content "As a user, I can view all of my projects"
    expect(page).to have_content "As a user, I can view all of the stories for a project"
  end
end
