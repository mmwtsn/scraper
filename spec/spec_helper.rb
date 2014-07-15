require 'webmock'
require_relative '../scraper'

# Ensure the expect syntax is used
RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
