require 'rails_helper'

RSpec.describe WeatherService do
  describe 'happy path' do
    it 'has current weather' do
      response = WeatherService.weather_connection(-77.019912, 38.892062)

      expect(response[:current]).to have_key(:dt)
      expect(response[:current]).to have_key(:sunrise)
      expect(response[:current]).to have_key(:sunset)
      expect(response[:current]).to have_key(:feels_like)
      expect(response[:current]).to have_key(:humidity)
      expect(response[:current]).to have_key(:uvi)
      expect(response[:current]).to have_key(:visibility)
      expect(response[:current][:weather][0]).to have_key(:description)
      expect(response[:current][:weather][0]).to have_key(:icon)
    end

    it 'has daily weather' do
      response = WeatherService.weather_connection(-77.019912, 38.892062)

      expect(response[:daily][0]).to have_key(:dt)
      expect(response[:daily][0]).to have_key(:sunrise)
      expect(response[:daily][0]).to have_key(:sunset)
      expect(response[:daily][0][:temp]).to have_key(:max)
      expect(response[:daily][0][:temp]).to have_key(:min)
      expect(response[:daily][0][:weather][0]).to have_key(:description)
      expect(response[:daily][0][:weather][0]).to have_key(:icon)
    end

    it 'has hourly weather' do
      response = WeatherService.weather_connection(-77.019912, 38.892062)

      expect(response[:hourly][0]).to have_key(:dt)
      expect(response[:hourly][0]).to have_key(:temp)
      expect(response[:hourly][0][:weather][0]).to have_key(:description)
      expect(response[:hourly][0][:weather][0]).to have_key(:icon)
    end
  end
end
