class Api::V1::RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])

    render json: @recipe
  end

  def create
    @recipe = Recipe.create(recipe_params)

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
    @recipe = Recipe.find(params[:recipe_id])
    @ingredients = @recipe.get_ingredients

    render json: @ingredients.as_json
  end

  private def recipe_params
    params.permit(:name, :url)
  end
end
