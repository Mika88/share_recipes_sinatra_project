class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
     t.string :name
     t.string :ingrediants_and_quantities
     t.string :instructions
     t.integer :user_id
   end
  end
end
