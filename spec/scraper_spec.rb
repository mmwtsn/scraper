require 'spec_helper'

describe Scraper do
  describe '.search_for(query, location)' do

    # Issa's snail haiku contains 'snail'
    it 'returns an array' do
      result = Scraper.search_for('snail', 'http://issa-haiku.org/snail.html')

      expect(result).to be_an_instance_of(Array)
    end

    # Issa's mock haiku web page contains 'haiku' three times, two of which are lowercase
    it 'ignores case of query' do
      result = Scraper.search_for('haiku', 'http://issa-haiku.org/snail.html')

      expect(result.length).to eq(4)
    end

    # Issa's snail haiku does not contain 'snake'
    it 'returns false when not found' do
      result = Scraper.search_for('snake', 'http://issa-haiku.org/snail.html')

      expect(result).to be_false
      expect(result).to_not be_nil # Ensure RSpec does not report a false positive
    end
  end
end
