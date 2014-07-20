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
    result = []
    regexp = /#{query}/i

    check_url(regexp, url, result)
    update_and_format_results(result, url)
  end

  private

  def check_url(regexp, url, result)
    open(url) do |f|
      f.each do |line|
        if regexp =~ line
          result << f.lineno
        end
      end
    end
  end

  def format_result(result)
    if result.empty?
      result = false
    elsif result.length == 1
      result = result[0]
    else
      result
    end
  end

  def update_and_format_results(result, url)
    result = format_result(result)
    @results[url] = result

    result
  end
end
