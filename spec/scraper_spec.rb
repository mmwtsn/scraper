require 'spec_helper'

describe Scraper do
  let(:url)   {'http://issa-haiku.org/snail.html'}
  let(:urls)  {[
    'http://issa-haiku.org/snail.html',
    'http://issa-haiku.org/winter.html'
  ]}

  before(:each) do
    @scraper = Scraper.new('snail')
  end

  describe '#new' do
    it 'returns a scraper object' do
      expect(@scraper).to be_an_instance_of(Scraper)
    end
  end

  describe '#query' do
    it 'accepts a string' do
      expect(@scraper.query).to be_an_instance_of(String)
    end

    it 'returns the query' do
      expect(@scraper.query).to eq('snail')
    end
  end

  describe '#found' do
    it 'is true when found' do
      pending
      expect(@scraper.found).to be_true
    end

    it 'is false when not found' do
      pending
      expect(@scraper.found).to     be_false
      expect(@scraper.found).to_not be_nil # no false positivies if nil
    end
  end

  describe '#results' do
    it 'returns a hash' do
      expect(@scraper.results).to be_an_instance_of(Hash)
    end
  end

  describe '#found?' do
    it 'returns a bool' do
      expect(@scraper.found?).to     be_false
      expect(@scraper.found?).to_not be_nil
    end

    it 'is an alias of #found' do
      expect(@scraper.found?).to eq(@scraper.found)
    end
  end
end
