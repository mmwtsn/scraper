# Load Rubygems
require 'bundler'
Bundler.require

module Scraper
  require 'open-uri'

  def self.search_for(query, location)
    result = false

    open(location) do |f|
      f.each do |line|
        if /#{query}/ =~ line
          result = true
          break
        end
      end

      return result
    end

  end

end
