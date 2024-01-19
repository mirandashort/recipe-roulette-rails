class CreateShoppingListRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :shopping_list_recipes do |t|
      t.bigint :shopping_list_id
      t.bigint :recipe_id

      t.timestamps
    end

    add_index :shopping_list_recipes, [:recipe_id, :shopping_list_id], unique: true
  end
end
