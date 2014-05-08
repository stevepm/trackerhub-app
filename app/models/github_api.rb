require 'faraday'
require 'octokit'

class GithubApi
  def initialize
    @client = Octokit::Client.new :access_token => ENV['GUS_TOKEN']

  end

  def github_comments(username, app, commit_id)
    comments = []
    @client.commit_comments("#{username}/#{app}", commit_id).each do |comment|
      comments << comment[:body]
    end
    comments
  end
end