class WeatherService

  def self.weather_connection(lon, lat)
    response = conn.get('/data/2.5/onecall') do |f|
      f.params['lon'] = lon
      f.params['lat'] = lat
      f.params['units'] = 'imperial'
      f.params['exclude'] = 'minutely'
    end
    weather_data(response)
  end

  private

  def self.conn
    conn = Faraday.new('https://api.openweathermap.org', params: {appid: ENV['WEATHER_KEY']})
  end

  def self.weather_data(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
