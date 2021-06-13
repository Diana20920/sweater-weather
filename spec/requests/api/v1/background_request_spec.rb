require 'rails_helper'

RSpec.describe 'Get BackgroundPic', :vcr do
  describe 'Happy Path' do
    it 'endpoint exists and has attributes' do
      location = 'denver,co'
      get "/api/v1/backgrounds?location=#{location}"

      expect(response).to be_successful

      body = JSON.parse(response.body, symbolize_names: true)

      expect(body).to have_key(:data)

      data = body[:data]
      expect(data.size).to eq(10)
      single_object = data.first

      expect(single_object).to have_key(:id)
      expect(single_object[:id]).to eq(nil)
      expect(single_object).to have_key(:type)
      expect(single_object[:type]).to eq('background_pic')
      expect(single_object).to have_key(:attributes)
      expect(single_object[:attributes]).to be_a(Hash)

      attributes = single_object[:attributes]
      expect(attributes.size).to eq(3)

      expect(attributes).to have_key(:location)
      expect(attributes[:location]).to be_a(String)
      expect(attributes).to have_key(:image_url)
      expect(attributes[:image_url]).to be_a(String)
      expect(attributes).to have_key(:credit)
      expect(attributes[:credit]).to be_a(Hash)

      credit = attributes[:credit]
      expect(attributes.size).to eq(3)

      expect(credit).to have_key(:source)
      expect(credit[:source]).to be_a(String)
      expect(credit).to have_key(:photographer)
      expect(credit[:photographer]).to be_a(String)
    end
  end
end
