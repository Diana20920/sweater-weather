class ApplicationController < ActionController::API
  def invalid_params
    render json: { error: 'Invalid parameters' }, status: :bad_request
  end

  def invalid_credentials
    render json: { error: 'Invalid credentials' }, status: 400
  end
end
