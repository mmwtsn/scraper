# Load Rubygems
require 'bundler'
Bundler.require

module Scraper
  require 'open-uri'

  def self.search_for(query, location)
    result = []

    open(location) do |f|
      f.each do |line|
        if /#{query}/i =~ line
          result << f.lineno
        end
      end

      if result.empty?
        result = false
      end

      return result
    end

  end

end
