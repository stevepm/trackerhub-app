require 'spec_helper'
require 'faraday'

feature 'Show pivotal tracker projects' do
  scenario 'user can view page with all projects' do
    visit '/'
    click_link "View Projects"
    expect(page).to have_content "App Review"
    expect(page).to have_content "Salary Survey"
  end
end
