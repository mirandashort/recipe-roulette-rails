# == Schema Information
#
# Table name: shopping_list_recipes
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
require "test_helper"

class ShoppingListRecipeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
