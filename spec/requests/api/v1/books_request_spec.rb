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

      data = body[:data]
      expect(data.size).to eq(3)
      single_object = data.first

      expect(single_object).to have_key(:id)
      expect(single_object[:id]).to eq(nil)
      expect(single_object).to have_key(:type)
      expect(single_object[:type]).to eq('books')
      expect(single_object).to have_key(:attributes)
      expect(single_object[:attributes]).to be_a(Hash)

      attributes = single_object[:attributes]
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

      forecast = attributes[:forecast]
      expect(forecast.size).to eq(2)

      expect(forecast).to have_key(:summary)
      expect(forecast[:summary]).to be_a(String)
      expect(forecast).to have_key(:temperature)
      expect(forecast[:temperature]).to be_a(String)

      books = attributes[:books]
      expect(books.size).to eq(quantity)

      first_book = books.first
      expect(first_book).to be_a(Hash)
      expect(first_book).to have_key(:isbn)


    end
  end
end

{
  "data": {
    "id": "null",
    "type": "books",
    "attributes": {
      "destination": "denver,co",
      "forecast": {
        "summary": "Cloudy with a chance of meatballs",
        "temperature": "83 F"
      },
      "total_books_found": 172,
      "books": [
        {
          "isbn": [
            "0762507845",
            "9780762507849"
          ],
          "title": "Denver, Co",
          "publisher": [
            "Universal Map Enterprises"
          ]
        },
        {
          "isbn": [
            "9780883183663",
            "0883183668"
          ],
          "title": "Photovoltaic safety, Denver, CO, 1988",
          "publisher": [
            "American Institute of Physics"
          ]
        },
        { ... same format for books 3, 4 and 5 ... }
      ]
    }
  }
}
