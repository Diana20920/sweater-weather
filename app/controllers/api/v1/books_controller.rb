class Api::V1::BooksController < ApplicationController
  def index
    destination = params[:location]
    quantity = params[:quantity].to_i
    conn = Faraday.get("http://openlibrary.org/search.json?q=#{destination}")
    response = JSON.parse(conn.body, symbolize_names: true)
    total_found = response[:numFound]

    forecast = ForecastFacade.current_weather(destination)

    books = response[:docs].map do |data|
      BookResult.new(data)
    end.first(quantity)

    search_results = BookSearch.new(total_found, destination, forecast, books)

    render json: BooksSerializer.new(search_results)
  end
end
