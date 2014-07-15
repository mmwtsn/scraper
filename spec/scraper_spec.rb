require 'spec_helper'

describe Scraper do
  describe '.search_for(query, location)' do

    # Issa's snail haiku contains 'snail'
    it 'returns true when found' do
      result = Scraper.search_for('snail', 'http://issa-haiku.org/snail.html')

      expect(result).to be_true
    end

    # Issa's snail haiku does not contain 'snake'
    it 'returns false when not found' do
      result = Scraper.search_for('snake', 'http://issa-haiku.org/snail.html')

      expect(result).to be_false
      expect(result).to_not be_nil # Ensure RSpec does not report a false positive
    end
  end
end
