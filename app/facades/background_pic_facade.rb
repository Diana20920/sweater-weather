class BackgroundPicFacade
  def self.get_backgroundpic(location)
    response = ImageService.fetch_images(location)
    response[:results].map do |result|
      BackgroundPic.new(result, location)
    end
  end
end
