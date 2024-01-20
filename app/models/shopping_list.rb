# == Schema Information
#
# Table name: shopping_lists
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ShoppingList < ApplicationRecord
  has_many :items, class_name: "ShoppingListItem", foreign_key: :shopping_list_id, dependent: :destroy
  has_many :recipes_shopping_lists, foreign_key: :shopping_list_id, dependent: :destroy, class_name: "RecipeShoppingList"
  has_many :recipes, through: :recipes_shopping_lists, class_name: "RecipeShoppingList"

  def add_item(amount:, unit:, name:)
    sli = ShoppingListItem.create!(amount:, unit:, name:, shopping_list_id: self.id)
  end
end
