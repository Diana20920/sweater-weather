require 'rails_helper'

RSpec.describe ForecastFacade do
  describe 'happy path' do
    it 'displays object with only necessary data' do
      result = ForecastFacade.get_forecast("alexandria,va")

      expect(result).to be_an(OpenStruct)
    end
  end
end
