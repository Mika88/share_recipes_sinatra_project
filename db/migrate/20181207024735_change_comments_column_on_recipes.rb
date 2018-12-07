class ChangeCommentsColumnOnRecipes < ActiveRecord::Migration
  def change
    change_column :recipes, :comments, :string, array: true, default: []
  end
end
