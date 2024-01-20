class ChangeShoppingListRecipesToRecipesShoppingLists < ActiveRecord::Migration[7.1]
  def change
    rename_table :shopping_list_recipes, :recipes_shopping_lists
    rename_index :table_name, 'index_shopping_list_recipes_on_recipe_id_and_shopping_li', 'index_recipes_shopping_lists_on_recipe_id_and_shopping_li'
  end
end
