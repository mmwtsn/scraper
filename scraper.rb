# Load Rubygems
require 'bundler'
Bundler.require

module Scraper
  require 'open-uri'

  def self.search_for(query, location, options = {})
    result = []

    if options[:ignore_case]
      regexp = /#{query}/i
    else
      regexp = /#{query}/
    end

    open(location) do |f|
      f.each do |line|
        if regexp =~ line
          result << f.lineno
        end
      end

      if result.empty?
        result = false
      end

      result
    end

  end

end
