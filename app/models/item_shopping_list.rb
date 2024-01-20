# == Schema Information
#
# Table name: items_shopping_lists
#
#  id               :integer          not null, primary key
#  amount           :string
#  checked          :boolean          default(FALSE), not null
#  name             :string
#  unit             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  shopping_list_id :bigint
#
class ItemShoppingList < ApplicationRecord
  self.table_name = "items_shopping_lists"

  belongs_to :shopping_list
end
