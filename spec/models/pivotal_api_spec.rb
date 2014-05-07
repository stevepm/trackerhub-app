require 'spec_helper'

describe PivotalApi do
  let(:steve) { PivotalApi.new }

  it 'can get project names' do
    steves_names = steve.get_projects.map do |project|
      project["project_name"]
    end
    expect(steves_names).to include('Salary Survey')
    expect(steves_names).to include('App Review')
  end

  it 'can view the stories for a specific project' do
    steves_stories = steve.get_stories('1075330')
    expect(steves_stories).to include "As a user, I can view all of the stories for a project"
    expect(steves_stories).to include "As a user, I can view all of my projects"
  end
end