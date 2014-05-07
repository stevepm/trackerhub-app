class PivotalApi

  def initialize
    @conn = Faraday.new(:url => 'https://www.pivotaltracker.com')
    @token = "?token=#{ENV['STEVE_PIVOTAL']}"
  end

  def get_body
    pivotal = @conn.get "/services/v5/me#{@token}"
    JSON.parse(pivotal.body)
  end

  def get_projects
    get_body["projects"]
  end

  def get_stories(project_id)
    stories = @conn.get "/services/v5/projects/#{project_id}/stories#{@token}"
    stories = JSON.parse(stories.body)
    stories.map do |story|
      story["name"]
    end
  end
end