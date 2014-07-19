# Load Rubygems
require 'bundler'
Bundler.require

# Load Ruby Libraries
require 'open-uri'

class Scraper
  attr_reader   :found, :results
  attr_accessor :query

  alias_method  :found?, :found

  def initialize(query)
    @query   = query
    @found   = false
    @results = {}
  end
end
