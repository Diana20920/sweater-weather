require 'rails_helper'

RSpec.describe MapService, :vcr do
  describe 'happy path' do
    it 'has coordinates' do
      response = MapService.map_connection("alexandria, va")

      expect(response.size).to eq(2)
      expect(response).to be_a(Hash)
      expect(response).to have_key(:lat)
      expect(response).to have_key(:lng)
    end
  end
end
