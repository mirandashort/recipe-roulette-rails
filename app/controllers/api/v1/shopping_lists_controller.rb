class Api::V1::ShoppingListsController < ApplicationController
  def show
    @shopping_list = ShoppingList.find(params[:id])

    render json: {
      id: @shopping_list.id,
      items: @shopping_list.items
    }
  end

  def destroy
    begin
      @shopping_list = ShoppingList.find(params[:id])
      @shopping_list.destroy

      render json: { message: "Shopping list successfully deleted"} , status: 200
    rescue StandardError => e
      render json: { message: e.message }, status: 500
    end
  end
end
