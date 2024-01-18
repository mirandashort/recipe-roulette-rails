class CreateShoppingListItems < ActiveRecord::Migration[7.1]
  def change
    create_table :shopping_list_items do |t|
      t.string :amount
      t.string :unit
      t.string :name
      t.bigint :shopping_list_id

      t.timestamps
    end
  end
end
