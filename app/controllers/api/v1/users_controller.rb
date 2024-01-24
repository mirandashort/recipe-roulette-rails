class Api::V1::UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create!(user_params)
  end

  def create_shopping_list
    @user ||= User.find(params[:user_id])
    @shopping_list = @user.create_shopping_list!

    render json: @shopping_list
  end

  def check_item
    item = ItemShoppingList.find(item_params[:item_shopping_list_id])
    item.update!(checked: true)

    render json: item
  end

  def uncheck_item
    item = ItemShoppingList.find(item_params[:item_shopping_list_id])
    item.update!(checked: false)

    render json: item
  end

  protected

  def item_params
    params.permit(:item_shopping_list_id)
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name)
  end
end
