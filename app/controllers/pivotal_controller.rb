class PivotalController < ApplicationController

  def index

  end

  def show
    @projects = PivotalApi.new.get_projects
    @body = PivotalApi.new.get_body
  end

  def project
    id = params[:id]
    @stories = PivotalApi.new.get_stories(id)
    @comments = PivotalApi.new.get_comments(id)
    @gh_comments = PivotalApi.new.github_comments(id).flatten
  end
end