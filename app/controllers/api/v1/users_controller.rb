class Api::V1::UsersController < ApplicationController
  def create_shopping_list
    user = User.find(params[:user_id])

    @shopping_list = user.create_shopping_list!

    render json: @shopping_list
  end

  def check_item
    user = User.find(params[:user_id])
    item_shopping_list_id = ItemShoppingList.find(item_params[:item_shopping_list_id])
    item.update!(checked: true)

    render json: { item: item_shopping_list_id, checked: true }
  end

  def user
    @user ||= User.find(params[:user_id])
  end

  def item_params
    params.permit(:item_shopping_list_id)
  end
end
