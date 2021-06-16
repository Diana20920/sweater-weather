class Api::V1::ForecastController < ApplicationController
  def index
    destination = params[:location]
    return invalid_params if destination == "" || destination.nil?
    body = ForecastFacade.get_forecast(destination)
    render json: ForecastSerializer.new(body)
  end
end
