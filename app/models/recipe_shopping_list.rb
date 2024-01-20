# == Schema Information
#
# Table name: recipes_shopping_lists
#
#  id               :integer          not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  recipe_id        :bigint
#  shopping_list_id :bigint
#
# Indexes
#
#  index_shopping_list_recipes_on_recipe_id_and_shopping_list_id  (recipe_id,shopping_list_id) UNIQUE
#
class RecipeShoppingList < ApplicationRecord
  self.table_name = "recipes_shopping_lists"

  belongs_to :shopping_list
  belongs_to :recipe

  validates :recipe, uniqueness: { scope: [:recipe_id, :shopping_list_id] }
end
