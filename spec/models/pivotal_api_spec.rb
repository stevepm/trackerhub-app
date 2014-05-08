require 'spec_helper'

describe PivotalApi do
  let(:steve) { PivotalApi.new }

  it 'can get project names' do
    VCR.use_cassette('models/tracker/view_project_names/magelowitz') do
      steves_names = steve.get_projects.map do |project|
        project["project_name"]
      end
      expect(steves_names).to include('Salary Survey')
      expect(steves_names).to include('App Review')
    end
  end

  it 'can view the stories for a specific project' do
    VCR.use_cassette('models/tracker/view_project_stories/magelowitz') do
      steves_stories = steve.get_stories('1075330')
      expect(steves_stories).to include "As a user, I can view all of the stories for a project"
      expect(steves_stories).to include "As a user, I can view all of my projects"
    end
  end

  it 'can view all comments for the project' do
    VCR.use_cassette('models/tracker/view_project_comments/magelowitz') do
      steves_comments = steve.get_comments('1075330')
      expect(steves_comments).to include "This is a comment on the comment story"
      expect(steves_comments).to include "What  a great comment"
    end
  end
end