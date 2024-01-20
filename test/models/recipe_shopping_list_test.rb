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
#  index_recipes_shopping_lists_on_recipe_id_and_shopping_list_id  (recipe_id,shopping_list_id) UNIQUE
#
require "test_helper"

class ShoppingListRecipeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
