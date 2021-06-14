class Api::V1::BooksController < ApplicationController
  def index
    destination = params[:location]
    quantity = params[:quantity].to_i

    forecast = ForecastFacade.current_weather(destination)

    search_results = BookSearchFacade.search_by_destination(destination, forecast, quantity)

    render json: BooksSerializer.new(search_results)
  end
end
