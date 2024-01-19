class Api::V1::RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])

    render json: @recipe
  end

  def create
    @recipe = Recipe.create(**recipe_params.delete(:recipe_id))

    render json: @recipe
  end

  def destroy
    begin
      @recipe = Recipe.find(params[:id])
      @recipe.destroy

      render json: { message: "Recipe successfully deleted"} , status: 200
    rescue StandardError => e
      render json: { message: e.message }, status: 500
    end
  end

  def ingredients
    @recipe = Recipe.find(recipe_params[:recipe_id])
    @ingredients = @recipe.get_ingredients

    render json: @ingredients.as_json
  end

  def add_to_shopping_list
    @recipe = Recipe.find(shopping_list_params[:recipe_id])
    ingredients = @recipe.get_ingredients
    shopping_list = ShoppingList.find_by(id: shopping_list_params[:shopping_list_id])

    ActiveRecord::Base.transaction do
      begin
        shopping_list ||= ShoppingList.create!
        @recipe.add_to_shopping_list(shopping_list_id: shopping_list.id)
        ShoppingListRecipe.create!(shopping_list:, recipe: @recipe)

        render json: {
          shopping_list_id: shopping_list.reload.id,
          recipes: shopping_list.recipes.map { |r| { id: r.id, name: r.name } }
        }
      rescue StandardError => e
        render json: { error: e.message }, status: 500

        raise ActiveRecord::Rollback
      end
    end

  end

  private def recipe_params
    params.permit(:name, :url, :recipe_id)
  end

  private def shopping_list_params
    params.permit(:shopping_list_id, :recipe_id)
  end
end
