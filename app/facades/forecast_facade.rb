class ForecastFacade

  def self.current_weather(location)
    coords = MapService.map_connection(location)
    current = WeatherService.weather_connection(coords[:lng], coords[:lat])
    {
      date_time:  convert_time(current[:current][:dt]),
      sunrise:    convert_time(current[:current][:sunrise]),
      sunset:     convert_time(current[:current][:sunset]),
      temperature:  current[:current][:temp],
      feels_like: current[:current][:feels_like].to_i,
      humidity:   current[:current][:humidity],
      uvi:        current[:current][:uvi],
      visibility: current[:current][:visibility],
      conditions: current[:current][:weather][0][:description],
      icon:       current[:current][:weather][0][:icon]
    }
  end

  def self.daily_weather(location)
    coords = MapService.map_connection(location)
    daily = WeatherService.weather_connection(coords[:lng], coords[:lat])[:daily]
    daily[0..4].map do |day|
      {
        date:       convert_time(day[:dt]),
        sunrise:    convert_time(day[:sunrise]),
        sunset:     convert_time(day[:sunset]),
        max_temp:   day[:temp][:max].to_i,
        min_temp:   day[:temp][:min].to_i,
        conditions: day[:weather][0][:description],
        icon:       day[:weather][0][:icon]
      }
    end
  end

  def self.hourly_weather(location)
    coords = MapService.map_connection(location)
    hourly = WeatherService.weather_connection(coords[:lng], coords[:lat])[:hourly]
    hourly[0..7].map do |hour|
      {
        time:        convert_time(hour[:dt]),
        temperature: hour[:temp].to_i,
        conditions:  hour[:weather][0][:description],
        icon:        hour[:weather][0][:icon]
      }
    end
  end

  def self.get_forecast(location)
    coords = MapService.map_connection(location)
    # create a poro here instead.
    response_hash = OpenStruct.new({
      id: nil,
      current_weather: self.current_weather(location),
      daily_weather: self.daily_weather(location),
      hourly_weather: self.hourly_weather(location)
      })
  end

  def self.convert_time(unix)
    Time.at(unix.to_i).to_s
  end
end
