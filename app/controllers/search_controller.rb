class SearchController < ApplicationController

  def new
    session[:query] = {}
    @levels     = load('levels')
    @categories = load('categories')
    @locations  = load('locations')
  end

  def create
    searcher = JobSearcher.new(params.fetch(:page, 1), search_params)

    session[:query] = searcher.query.except(:page)

    @results = JSON.parse(searcher.jobs.body, symbolize_names: true)
    @jobs = @results[:results]&.map { |res| Job.new(res) }
  end

  private

  def search_params
    params.fetch(:query, session[:query]&.symbolize_keys)
  end

  def load(filename)
    YAML.load_file("config/#{ filename }.yml")
  end

end
