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
    regexp = build_regexp

    check_location(regexp, url, result)
    result = format_result(result)
    @results[url] = result

    update_found(url)

    result
  end

  private

  def build_regexp
    /#{@query}/i
  end

  def check_location(regexp, url, result)
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

  def update_found(url)
    unless @results[url] == false
      @found = true
    end
  end
end
