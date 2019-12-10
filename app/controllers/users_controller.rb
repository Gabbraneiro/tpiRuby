class UsersController < ApplicationController

  # POST /usuarios
  def create
    @user = User.new(request_params)
    if @user.valid?
      json_response(User.create(request_params), :created)
    else
      json_response(nil, :bad_request, @user.errors)
    end
  end

end
