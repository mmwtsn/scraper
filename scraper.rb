# Load Rubygems
require 'bundler'
Bundler.require

# Load Ruby Libraries
require 'open-uri'

class Scraper
  attr_reader   :found, :results
  attr_accessor :query

  def initialize(query)
    @query   = query
    @found   = false
    @results = []
  end
end
