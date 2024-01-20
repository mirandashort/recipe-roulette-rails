class Api::V1::UsersController < ApplicationController
  def create_shopping_list
    @user = User.find(params[:user_id])

    @shopping_list = @user.create_shopping_list!

    render json: @shopping_list
  end
end
