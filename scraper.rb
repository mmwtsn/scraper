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

  def scrape(url)
    regexp = /#{query}/i
    result = []

    check_url(regexp, url, result)

    format_result(result)
  end

  private

  def format_result(result)
    if result.empty?
      result = false
    elsif result.length == 1
      result = result[0]
    else
      result
    end
  end

  def check_url(regexp, url, result)
    open(url) do |f|
      f.each do |line|
        if regexp =~ line
          result << f.lineno
        end
      end
    end
  end
end
