# == Schema Information
#
# Table name: items_shopping_lists

#
#  id               :integer          not null, primary key
#  amount           :string
#  name             :string
#  unit             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  shopping_list_id :bigint
#
require "test_helper"

class ShoppingListItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end