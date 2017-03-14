class JobSearcher
  include HTTParty

  disable_rails_query_string_format
  base_uri 'api-v2.themuse.com'

  def initialize(page, query)
    puts query
    @options = {
      page: page,
      location: query[:location],
      company: company_parser(query[:company]),
      category: query[:category],
      level: query[:level]
    }
  end

  def jobs
    self.class.get('/jobs', query: query)
  end

  def query
    @options.compact
  end

  def company_parser(str)
    str.class == Array ? str : str.split(',').map(&:strip)
  end

end
