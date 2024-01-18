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

  def add_item(amount:, unit:, name:)
    ShoppingListItem.create!(amount:, unit:, name:, shopping_list_id: self.id)
  end
end
