class ImageService
  def self.fetch_images(location)
    response = conn.get("search/photos?page=1&query=#{location}")
    parse_json(response)
  end

  private

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new("https://api.unsplash.com") do |faraday|
      faraday.headers['authorization'] = "Client-ID #{ENV['PICS_KEY']}"
    end
  end
end
