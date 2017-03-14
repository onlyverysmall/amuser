class SearchController < ApplicationController

  def new
    session[:query] = {}
    @levels     = load('levels')
    @categories = load('categories')
    @locations  = load('locations')
  end

  def create
  end

end
