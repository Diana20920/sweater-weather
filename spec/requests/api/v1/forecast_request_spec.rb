require 'rails_helper'

RSpec.describe 'Get Forecast' do
  describe 'Happy Path' do
    it 'endpoint exists and has attributes' do
      location = 'denver,co'
      get "/api/v1/forecast?location=#{location}"

      expect(response).to be_successful

      body = JSON.parse(response.body, symbolize_names: true)

      expect(body).to have_key(:data)

      data= body[:data]
      expect(data.size).to eq(3)

      expect(data).to have_key(:id)
      expect(data[:id]).to eq(nil)
      expect(data).to have_key(:type)
      expect(data[:type]).to eq('forecast')
      expect(data).to have_key(:attributes)
      expect(data[:attributes]).to be_a(Hash)

      attributes = data[:attributes]
      expect(attributes.size).to eq(3)

      expect(attributes).to have_key(:current_weather)
      expect(attributes[:current_weather]).to be_a(Hash)
      expect(attributes).to have_key(:daily_weather)
      expect(attributes[:daily_weather]).to be_a(Array)
      expect(attributes).to have_key(:hourly_weather)
      expect(attributes[:hourly_weather]).to be_a(Array)

      current_weather = attributes[:current_weather]
      expect(current_weather.size).to eq(10)

      expect(current_weather).to have_key(:date_time)
      expect(current_weather[:date_time]).to be_a(String)
      expect(current_weather).to have_key(:sunrise)
      expect(current_weather[:sunrise]).to be_a(String)
      expect(current_weather).to have_key(:sunset)
      expect(current_weather[:sunset]).to be_a(String)
      expect(current_weather).to have_key(:temperature)
      expect(current_weather[:temperature]).to be_a(Float)
      expect(current_weather).to have_key(:feels_like)
      # expect(current_weather[:feels_like]).to be_a(Float)
      expect(current_weather).to have_key(:humidity)
      expect(current_weather[:humidity]).to be_an(Integer)
      expect(current_weather).to have_key(:uvi)
      expect(current_weather[:uvi]).to be_an(Float)
      expect(current_weather).to have_key(:visibility)
      expect(current_weather[:visibility]).to be_an(Integer)
      expect(current_weather).to have_key(:conditions)
      expect(current_weather[:conditions]).to be_a(String)
      expect(current_weather).to have_key(:icon)
      expect(current_weather[:icon]).to be_a(String)

      daily_weather = attributes[:daily_weather]
      expect(daily_weather.size).to eq(5)

      expect(daily_weather[0]).to have_key(:date)
      expect(daily_weather[0][:date]).to be_a(String)
      expect(daily_weather[0]).to have_key(:sunrise)
      expect(daily_weather[0][:sunrise]).to be_a(String)
      expect(daily_weather[0]).to have_key(:sunset)
      expect(daily_weather[0][:sunset]).to be_a(String)
      expect(daily_weather[0]).to have_key(:max_temp)
      # expect(daily_weather[0][:max_temp]).to be_an(Float)
      expect(daily_weather[0]).to have_key(:min_temp)
      # expect(daily_weather[0][:min_temp]).to be_an(Float)
      expect(daily_weather[0]).to have_key(:conditions)
      expect(daily_weather[0][:conditions]).to be_a(String)
      expect(daily_weather[0]).to have_key(:icon)
      expect(daily_weather[0][:icon]).to be_a(String)

      hourly_weather = attributes[:hourly_weather]
      expect(hourly_weather.size).to eq(8)

      expect(hourly_weather[0]).to have_key(:time)
      expect(hourly_weather[0][:time]).to be_a(String)
      expect(hourly_weather[0]).to have_key(:temperature)
      # expect(hourly_weather[0][:temperature]).to be_an(Float)
      expect(hourly_weather[0]).to have_key(:conditions)
      expect(hourly_weather[0][:conditions]).to be_a(String)
      expect(hourly_weather[0]).to have_key(:icon)
      expect(hourly_weather[0][:icon]).to be_a(String)
    end
  end
end
