# == Schema Information
#
# Table name: shopping_lists
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
require "test_helper"

class ShoppingListTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
