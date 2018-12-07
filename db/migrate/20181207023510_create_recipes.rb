class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
     t.string :name
     t.string :ingrediants
     t.string :instructions
     t.string :comments
     t.integer :user_id
   end
 end
end
