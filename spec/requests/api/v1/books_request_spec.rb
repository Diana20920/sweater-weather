require 'rails_helper'

RSpec.describe 'Search for Books per Destination City' do
  describe 'Happy Path' do
    it 'endpoint exists and has attributes' do
      location = 'denver,co'
      quantity = 5
      get "/api/v1/book-search?location=#{location}&quantity=#{quantity}"

      expect(response).to be_successful

      body = JSON.parse(response.body, symbolize_names: true)

      expect(body).to have_key(:data)

      data = body[:data][0]
      expect(data.size).to eq(3)

      expect(data).to have_key(:id)
      expect(data[:id]).to eq(nil)
      expect(data).to have_key(:type)
      expect(data[:type]).to eq('books')
      expect(data).to have_key(:attributes)
      expect(data[:attributes]).to be_a(Hash)

      attributes = data[:attributes]
      expect(attributes.size).to eq(4)

      expect(attributes).to have_key(:destination)
      expect(attributes[:destination]).to be_a(String)
      expect(attributes[:destination]).to eq(location)
      expect(attributes).to have_key(:forecast)
      expect(attributes[:forecast]).to be_a(Hash)
      expect(attributes).to have_key(:total_books_found)
      expect(attributes[:total_books_found]).to be_an(Integer)
      expect(attributes).to have_key(:books)
      expect(attributes[:books]).to be_an(Array)

      forecast = attributes[:forecast] # forecast in that city right now
      expect(forecast.size).to eq(2)

      expect(forecast).to have_key(:summary)
      expect(forecast[:summary]).to be_a(String)
      expect(forecast).to have_key(:temperature)
      expect(forecast[:temperature]).to be_a(String)

      books = attributes[:books]
      binding.pry
      expect(books.size).to eq(quantity)

      first_book = books.first
      expect(first_book.size).to eq(3)

      expect(first_book).to be_a(Hash)
      expect(first_book).to have_key(:isbn)
      expect(first_book[:isbn]).to be_an(Array)
      expect(first_book).to have_key(:title)
      expect(first_book[:title]).to be_a(String)
      expect(first_book).to have_key(:publisher)
      expect(first_book[:publisher]).to be_an(Array)
    end
  end
end
