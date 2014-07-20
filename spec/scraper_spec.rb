require 'spec_helper'

describe Scraper do
  let(:query) {'snail'}
  let(:url)   {'http://issa-haiku.org/snail.html'}
  let(:urls)  {[
    'http://issa-haiku.org/snail.html',
    'http://issa-haiku.org/winter.html'
  ]}

  subject(:scraper) { Scraper.new(query) }

  describe '#new' do
    it 'returns a scraper object' do
      expect(scraper).to be_a(Scraper)
    end
  end

  describe '#query' do
    it 'accepts a string' do
      expect(scraper.query).to be_a(String)
    end

    it 'returns the query' do
      expect(scraper.query).to eq(query)
    end
  end

  describe '#found' do
    it 'is true when found' do
      pending
      expect(scraper.found).to be_true
    end

    it 'is false when not found' do
      pending
      expect(scraper.found).to     be_false
      expect(scraper.found).to_not be_nil # no false positivies if nil
    end
  end

  describe '#results' do
    it 'returns a hash' do
      expect(scraper.results).to be_a(Hash)
    end
  end

  describe '#found?' do
    it 'is an alias of #found' do
      expect(scraper.found?).to eq(scraper.found)
    end

    it 'returns a bool' do
      expect(scraper.found?).to     be_false
      expect(scraper.found?).to_not be_nil
    end
  end

  describe '#scrape' do
    subject(:result) { scraper.scrape(url) }

    after(:each) { expect(result).to eq(scraper.results[url]) }

    context 'with no results' do
      let(:query) { 'null' }

      it 'returns false' do
        expect(result).to     be_false
        expect(result).to_not be_nil
      end
    end

    context 'with one result' do
      let(:query) { 'fuji' } # matched once

      it 'returns an integer' do
        expect(result).to be_an(Integer)
      end
    end

    context 'with many results' do
      let(:query) { 'haiku' } # matched four times

      it 'returns an array of integers' do
        expect(result).to be_an(Array)
      end

      it 'returns a length of 4' do
        expect(result.length).to eq(4)
      end
    end
  end
end
