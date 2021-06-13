require 'rails_helper'

RSpec.describe ImageService, :vcr do
  describe 'class methods' do
    describe '::fetch_images' do
      it 'returns data from image external API' do
        results = ImageService.fetch_images("alexandria,va")
        expect(results[:results]).to be_a(Array)
        expect(results[:results][0]).to be_a(Hash)
        expect(results[:results][0]).to have_key :id
        expect(results[:results][0]).to have_key :urls
        expect(results[:results][0]).to have_key :links
        expect(results[:results][0]).to have_key :user
      end
    end
  end
end
