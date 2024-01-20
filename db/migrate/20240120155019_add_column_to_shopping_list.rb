class AddColumnToShoppingList < ActiveRecord::Migration[7.1]
  def change
    add_column :shopping_lists, :user_id, :bigint, null: false
  end
end
