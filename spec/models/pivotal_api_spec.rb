require 'spec_helper'

describe PivotalApi do
  it 'can get the body for steve' do
    steve = PivotalApi.new
    steves_body = steve.get_projects
    expect(steves_body).to include('Salary Survey')
    expect(steves_body).to include('App Review')
  end
end