require 'rails_helper'

RSpec.describe BooksService do
  describe 'class methods' do
    describe '::search_books' do
      it 'fetches books based on the destination set by user' do
        results = BooksService.search_books("denver,co")
        
        expect(results).to be_a(Hash)
        expect(results).to have_key(:numFound)
        expect(results[:numFound]).to be_an(Integer)
        expect(results).to have_key(:docs)
        expect(results[:docs]).to be_an(Array)
      end
    end
  end
end
