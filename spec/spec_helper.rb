require 'webmock/rspec'
require_relative '../scraper'

snail  = IO.read('./spec/support/issa-snail.html')
winter = IO.read('./spec/support/issa-winter.html')

# Configure RSpec
RSpec.configure do |config|
  # Ensure the expect syntax is used
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  # Stub external HTTP requests with WebMock
  config.before(:each) do
    haiku_request("snail", snail)
    haiku_request("winter", winter)
  end
end

def haiku_request(haiku, body)
  stub_request(:get, %r(issa-haiku.org/#{haiku})).
    with(headers: {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
    to_return(status: 200, body: body, headers: {})
end
