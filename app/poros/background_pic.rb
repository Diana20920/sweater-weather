class BackgroundPic
  attr_reader :id, :location, :image_url, :credit

  def initialize(data, location)
    @id = nil
    @location = location
    @image_url = data[:urls][:full]
    @credit = photographer_credit(data)
  end

  def photographer_credit(data)
    {
      source: data[:links][:html],
      photographer: data[:user][:name]
    }
  end
end
