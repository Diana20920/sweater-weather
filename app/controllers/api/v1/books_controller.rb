class Api::V1::BooksController < ApplicationController
  def index
    destination = params[:location]
    quantity = params[:quantity]
    conn = Faraday.get("http://openlibrary.org/search.json?q=#{destination}")
    response = JSON.parse(conn.body, symbolize_names: true)
    total_found = response[:numFound]

    forecast = ForecastFacade.current_weather(destination)

    search_results = response[:docs].map do |data|
      BookSearch.new(total_found, destination, forecast, data)
    end
    binding.pry

  end
end
