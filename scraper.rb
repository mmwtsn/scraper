# Load Rubygems
require 'bundler'
Bundler.require

module Scraper
  require 'open-uri'

  def self.search_for(query, location, options = {})
    result = {}
    result[location] = []

    if options[:ignore_case]
      regexp = /#{query}/i
    else
      regexp = /#{query}/
    end

    open(location) do |f|
      f.each do |line|
        if regexp =~ line
          result[location] << f.lineno
        end
      end

      if result[location].empty?
        result = false
      end

      result
    end

  end

end
