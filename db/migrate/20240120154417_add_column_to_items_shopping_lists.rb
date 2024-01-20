class AddColumnToItemsShoppingLists < ActiveRecord::Migration[7.1]
  def change
    add_column :items_shopping_lists, :checked, :boolean, null: false, default: false
  end
end
