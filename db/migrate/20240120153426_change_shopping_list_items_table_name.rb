class ChangeShoppingListItemsTableName < ActiveRecord::Migration[7.1]
  def change
    rename_table :shopping_list_items, :items_shopping_lists
  end
end
