class PivotalController < ApplicationController

  def index

  end

  def show
    @projects = PivotalApi.new.get_projects
  end
end