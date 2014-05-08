require 'spec_helper'
require 'faraday'

feature 'Show pivotal tracker projects' do
  scenario 'user can view page with all projects' do
    VCR.use_cassette('features/tracker/view_projects/magelowitz') do
      visit '/'
      click_link "View Projects"
      expect(page).to have_content "App Review"
      expect(page).to have_content "Salary Survey"
    end
  end

  scenario 'User can see stories per project' do
    VCR.use_cassette('features/tracker/view_stories/magelowitz') do
      visit '/'
      click_link "View Projects"
      click_on 'Magelowitz and King TrackerHub'
      expect(page).to have_content "As a user, I can view all of my projects"
      expect(page).to have_content "As a user, I can view all of the stories for a project"
    end
  end

  scenario 'User is able to see all project comments' do
    VCR.use_cassette('features/tracker/view_project_comments/magelowitz') do
      visit '/'
      click_link "View Projects"
      click_on 'Magelowitz and King TrackerHub'
      expect(page).to have_content "This is a comment on the comment story"
      expect(page).to have_content "This is a second test comment on the first story"
    end
  end

  scenario 'User can see comments that are on github' do
    VCR.use_cassette('features/tracker/view_github_comments/king', :record => :all) do
      visit '/'
      click_link "View Projects"
      click_on 'Magelowitz and King TrackerHub'
      expect(page).to have_content "test comment"
      expect(page).to have_content "gus king comment test"
    end
  end
end
