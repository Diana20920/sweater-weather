class BookSearch
  attr_reader :destination,
              :forecast,
              :total_books_found,
              :books

  def initialize(total_found, destination, forecast, data)
    @destination = destination
    @forecast = weather_info(forecast)
    @total_books_found = total_found
    @books = books_found(data)
  end

  def weather_info(forecast)
    {
      summary: forecast[:conditions],
      temperature: "#{forecast[:temperature].to_i} F"
    }
  end

  def books_found(data)
    [  
      isbn: data[:isbn],
      title: data[:title],
      publisher: data[:publisher]
    ]
  end
end
