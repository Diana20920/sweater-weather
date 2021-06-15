class ApplicationController < ActionController::API
  def invalid_credentials
    render json: { error: 'Invalid credentials' }, status: 400
  end
end
