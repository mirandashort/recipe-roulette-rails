class ChangeRecipeUrlToUnique < ActiveRecord::Migration[7.1]
  def change
    add_index :recipes, :url, unique: true
  end
end
