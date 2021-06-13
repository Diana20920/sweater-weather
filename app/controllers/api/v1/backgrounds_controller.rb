class Api::V1::BackgroundsController < ApplicationController
  def index
    location = params[:location]
    body =  BackgroundPicFacade.get_backgroundpic(location)
    render json: BackgroundPicSerializer.new(body)
  end
end
