require 'spec_helper'

describe GithubApi do
  it 'will return the comments from github for a single commit' do
    VCR.use_cassette('models/github/view_comments', :record => :all) do
      github = GithubApi.new
      comments = github.github_comments('stevepm','trackerhub-app','69245350b031c5573fe2b6da9dad4514f5625f0d')
      expect(comments).to include "gus king comment test"
      expect(comments).to include "test comment"
    end
  end
end