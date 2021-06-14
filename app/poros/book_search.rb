class BookSearch
  attr_reader :id,
              :destination,
              :forecast,
              :total_books_found,
              :books

  def initialize(total_found, destination, forecast, data, limit)
    @id                = nil
    @destination       = destination
    @forecast          = weather_info(forecast)
    @total_books_found = total_found
    @books             = books_found(data, limit)
  end

  def weather_info(forecast)
    {
      summary: forecast[:conditions],
      temperature: "#{forecast[:temperature].to_i} F"
    }
  end

  def books_found(data, limit)
    data.map do |info|
      BookResult.new(data)
    end.first(limit)
  end
end
