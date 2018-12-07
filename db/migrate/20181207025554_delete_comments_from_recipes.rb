class DeleteCommentsFromRecipes < ActiveRecord::Migration
  def change
    remove_column :recipes, :comments
  end
end
