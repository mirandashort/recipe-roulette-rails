# == Schema Information
#
# Table name: shopping_list_items
#
#  id               :integer          not null, primary key
#  amount           :string
#  name             :string
#  unit             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  shopping_list_id :bigint
#
class ShoppingListItem < ApplicationRecord
  belongs_to :shopping_list
end
