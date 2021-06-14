require 'rails_helper'

RSpec.describe BookSearchFacade do
  describe 'class methods' do
    describe '::search_by_destination' do
      it 'returns object from search results' do
        results = BookSearchFacade.search_by_destination("denver,co", 4)

        expect(results.books).to be_an(Array)
        expect(results.books.size).to eq(4)
        expect(results.destination).to eq("denver,co")
        expect(results.forecast).to be_a(Hash)
        expect(results.id).to eq(nil)
      end
    end
  end
end
