class RenameIngrediantsAndQuantitiesColumn < ActiveRecord::Migration
  def change
    rename_column :recipes, :ingrediants_and_quantities, :ingredients
  end
end
