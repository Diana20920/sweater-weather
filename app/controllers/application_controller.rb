class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :unable_to_create

  def unable_to_create(exception)
    render json: { error: exception.message }, status: 400
  end

  def invalid_params
    render json: { error: 'Invalid parameters' }, status: 400
  end

  def invalid_credentials
    render json: { error: 'Invalid credentials' }, status: 400
  end
end
