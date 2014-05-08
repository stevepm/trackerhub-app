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

  def get_comments(project_id)
    comments_array = []
    stories = @conn.get "/services/v5/projects/#{project_id}/stories#{@token}"
    stories = JSON.parse(stories.body)
    stories.each do |story|
      story_id = story["id"]
      comments = @conn.get "/services/v5/projects/#{project_id}/stories/#{story_id}/comments#{@token}"
      comments = JSON.parse(comments.body)
      comments.each do |comment|
        comments_array << comment["text"]
      end
    end
    comments_array
  end

  def github_comments(project_id)
    comments = []
    get_comments(project_id).each do |comment|
      if comment.match(/.*https:\/\/github.com\/(\w+)\/([\w[-]?]+)\/commit\/(\w+)/)
        comment = comment.scan(/.*https:\/\/github.com\/(\w+)\/([\w[-]?]+)\/commit\/(\w+)/)
        username = comment.flatten[0]
        app = comment.flatten[1]
        commit_id = comment.flatten[2]
        comments << GithubApi.new.github_comments(username, app, commit_id)
      end
    end
    comments
  end
end