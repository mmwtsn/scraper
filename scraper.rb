# Load Rubygems
require 'bundler'
Bundler.require

module Scraper
  require 'open-uri'

  def self.search_for(query, location, options = {})
    result = {}
    result[location] = []

    check(query, location, result, options)
  end

  private

  def self.build_regexp(query, options = {})
    if options[:ignore_case]
      regexp = /#{query}/i
    else
      regexp = /#{query}/
    end

    regexp
  end

  def self.build_result(result, location)
    if result[location].empty?
      result = false
    end

    result
  end

  def self.build_location(location)
    if location.instance_of?(String)
      location = [location]
    end

    location
  end

  def self.open_location(location, regexp, result)
    open(location) do |f|
      f.each do |line|
        if regexp =~ line
          result[location] << f.lineno
        end
      end
    end
  end

  def self.check(query, location, result, options = {})
    regexp = build_regexp(query, options)

    open_location(location, regexp, result)

    result = build_result(result, location)
  end
end
