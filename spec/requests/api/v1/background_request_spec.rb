require 'rails_helper'

RSpec.describe 'Get BackgroundPic' do
  describe 'Happy Path' do
    it 'endpoint exists and has attributes' do
      location = 'denver,co'
      get "/api/v1/backgrounds?location=#{location}"

      expect(response).to be_successful

      body = JSON.parse(response.body, symbolize_names: true)

      expect(body).to have_key(:data)

      data = body[:data]
      expect(data.size).to eq(3)

      expect(data).to have_key(:id)
      expect(data[:id]).to eq(nil)
      expect(data).to have_key(:type)
      expect(data[:type]).to eq('backgroundpic')
      expect(data).to have_key(:attributes)
      expect(data[:attributes]).to be_a(Hash)

      attributes = data[:attributes]
      expect(attributes.size).to eq(1)
      expect(attributes).to have_key(:backgroundpic)

      backgroundpic = attributes[:backgroundpic]
      expect(backgroundpic.size).to eq(3)

      expect(backgroundpic).to have_key(:location)
      expect(backgroundpic[:location]).to be_a(String)
      expect(backgroundpic).to have_key(:backgroundpic_url)
      expect(backgroundpic[:backgroundpic_url]).to be_a(String)
      expect(backgroundpic).to have_key(:credit)
      expect(backgroundpic[:credit]).to be_a(Hash)

      credit = backgroundpic[:credit]
      expect(backgroundpic.size).to eq(3)

      expect(credit).to have_key(:source)
      expect(credit[:source]).to be_a(String)
      expect(credit).to have_key(:author)
      expect(credit[:author]).to be_a(String)
      expect(credit).to have_key(:logo)
      expect(credit[:logo]).to be_a(String)
    end
  end
end
