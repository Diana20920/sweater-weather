class Api::V1::UsersController < ApplicationController
  def create
    user = User.create!(user_params)

  end

  private

  def user_params
    binding.pry
  end
end
