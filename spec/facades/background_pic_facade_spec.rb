require 'rails_helper'

RSpec.describe BackgroundPicFacade, :vcr do
  describe "class methods" do
    describe "::get_backgroundpic" do
      it "returns array of 10 background OBJECT data" do
        background_images = BackgroundPicFacade.get_backgroundpic("alexandria,va")
        expect(background_images).to be_a Array
        expect(background_images.count).to eq(10)

        image = background_images.first
        expect(image).to be_a BackgroundPic
        expect(image.id).to eq(nil)
        expect(image.location).to eq("alexandria,va")
        expect(image.image_url).to be_a(String)
        expect(image.credit).to be_a(Hash)
      end
    end
  end
end
