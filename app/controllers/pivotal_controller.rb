class PivotalController < ApplicationController

  def index

  end

  def show
    @projects = PivotalApi.new.get_projects
  end

  def project
    id = params[:id]
    @stories = PivotalApi.new.get_stories(id)
  end
end