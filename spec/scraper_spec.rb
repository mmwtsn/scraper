require 'spec_helper'

describe Scraper do
  describe '.search_for(query, location)' do
    let(:url) {'http://issa-haiku.org/snail.html'}

    # Issa's snail haiku contains 'snail'
    it 'returns an array' do
      result = Scraper.search_for('snail', url)

      expect(result).to be_an_instance_of(Hash)
    end

    # Issa's mock haiku web page contains 'haiku' twice
    it 'returns all line matches' do
      result = Scraper.search_for('haiku', url)

      expect(result.length).to eq(2)
    end

    # Issa's mock haiku web page contains 'haiku' twice and 'Haiku' twice
    it 'ignores case when requested' do
      result = Scraper.search_for('haiku', url, ignore_case: true)

      expect(result.length).to eq(4)
    end

    # Issa's snail haiku does not contain 'snake'
    it 'returns false when not found' do
      result = Scraper.search_for('snake', url)

      expect(result).to be_false
      expect(result).to_not be_nil # Ensure RSpec does not report a false positive
    end
  end
end
