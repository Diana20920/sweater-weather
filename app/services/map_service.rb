class MapService

  def self.map_connection(location)
    response = conn.get('/geocoding/v1/address') do |f|
      f.params['location'] = location
    end
    coords_data(response)[:results][0][:locations][0][:latLng]
    # => {:lat=>36.845117, :lng=>-75.975518}
  end

  private

  def self.coords_data(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    conn = Faraday.new('http://www.mapquestapi.com', params: { key: ENV['MAPS_KEY'] })
  end
end
