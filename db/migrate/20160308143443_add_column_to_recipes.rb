class AddColumnToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :ingredient_number, :integer
  end
end
