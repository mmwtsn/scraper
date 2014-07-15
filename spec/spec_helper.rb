require 'webmock/rspec'
require_relative '../scraper'

body = IO.read('./spec/support/issa-haiku.html')

# Configure RSpec
RSpec.configure do |config|
  # Ensure the expect syntax is used
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  # Stub external HTTP requests with WebMock
  config.before(:each) do
    stub_request(:get, /issa-haiku.org/).
      with(headers: {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
      to_return(status: 200, body: body, headers: {})
  end
end
