# == Schema Information
#
# Table name: recipes
#
#  id         :integer          not null, primary key
#  name       :string
#  url        :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Recipe < ApplicationRecord
  INGREDIENT_LIST_ITEM_CSS = ".mntl-structured-ingredients__list-item"

  def get_ingredients
    doc = Nokogiri::HTML5(URI.open(self.url))
    ingredients = doc.css(INGREDIENT_LIST_ITEM_CSS).map do |i|
      text = i.text.gsub("\n", "")
      Recipe.parse_ingredient(text)
    end
  end

  def self.parse_ingredient(ingredient)
    # Define a regular expression to match the name, amount, and unit of measurement.
    regex = /^(?<amount>(\d+(\s*\d*\/\d+)?)|[^\u0000-\u007F])\s*(?<unit>[a-zA-Z]+)?\s*(?<name>.+)$/

    # Match the regular expression against the ingredient string
    match_data = ingredient.match(regex)

    # Check if there is a match
    if match_data
      amount = match_data[:amount]
      unit = match_data[:unit]
      name = match_data[:name].strip

      # Return a hash containing the parsed values
      { amount: amount, unit: unit, name: name }
    else
      # Return nil if no match is found
      nil
    end
  end

  def add_to_shopping_list(shopping_list_id:)
    shopping_list = ShoppingList.find(shopping_list_id)
    ingredients = self.get_ingredients
    ingredients.each { |ing| shopping_list.add_item(**ing) }
  end
end
