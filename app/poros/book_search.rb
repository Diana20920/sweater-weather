class BookSearch
  attr_reader :id,
              :destination,
              :forecast,
              :total_books_found,
              :books

  def initialize(total_found, destination, forecast, books)
    @id                = nil
    @destination       = destination
    @forecast          = weather_info(forecast)
    @total_books_found = total_found
    @books             = books
  end

  def weather_info(forecast)
    {
      summary: forecast[:conditions],
      temperature: "#{forecast[:temperature].to_i} F"
    }
  end
end
