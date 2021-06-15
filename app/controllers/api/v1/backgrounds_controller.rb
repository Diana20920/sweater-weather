class Api::V1::BackgroundsController < ApplicationController
  def index
    location = params[:location]
    return invalid_params if location == "" || location.nil?
    body =  BackgroundPicFacade.get_backgroundpic(location)
    render json: BackgroundPicSerializer.new(body)
  end
end
