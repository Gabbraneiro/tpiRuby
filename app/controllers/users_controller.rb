class UsersController < ApplicationController
  # POST /usuarios
  def create
    @user = User.new(request_params)
    if @user.save
        render jsonapi: @user, status: :created
    else
        render jsonapi_errors: @user.errors
    end
  end

end
