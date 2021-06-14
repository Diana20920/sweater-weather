class Api::V1::BooksController < ApplicationController
  def index
    destination = params[:location]
    quantity = params[:quantity]
    conn = Faraday.get("http://openlibrary.org/search.json?q=#{destination}")
    response = JSON.parse(conn.body, symbolize_names: true)
    response.map do |
    binding.pry

  end
end
