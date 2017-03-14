class Job
  attr_reader :name, :pub_date, :locations, :categories,
    :levels, :tags, :company, :landing

  def initialize(obj)
    puts obj
    @name       = obj[:name]
    @pub_date   = Time.new(obj[:publication_date])
    @locations  = obj[:locations].map { |loc| loc[:name] }
    @categories = obj[:categories].map { |cat| cat[:name] }
    @levels     = obj[:levels].map { |lev| lev[:name] }
    @company    = obj[:company][:name]
    @landing    = obj[:refs][:landing_page]
  end
end
