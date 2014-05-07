class PivotalApi

  def get_body
    conn = Faraday.new(:url => 'https://www.pivotaltracker.com')
    pivotal = conn.get "/services/v5/me?token=#{ENV['STEVE_PIVOTAL']}"
    JSON.parse(pivotal.body)

  end

  def get_projects
    get_body["projects"].map do |proj|
      proj["project_name"]
    end
  end

end