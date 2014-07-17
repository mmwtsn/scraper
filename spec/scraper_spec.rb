require 'spec_helper'

describe Scraper do
  before(:each) do
    @scraper = Scraper.new('snail')
  end

  let(:url)  {'http://issa-haiku.org/snail.html'}
  let(:urls) {[
    'http://issa-haiku.org/snail.html',
    'http://issa-haiku.org/winter.html'
  ]}
end
