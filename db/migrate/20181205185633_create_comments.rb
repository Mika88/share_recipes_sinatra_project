class CreateComments < ActiveRecord::Migration
  def change
     create_table :comments do |t|
     t.string :title
     t.string :content
     t.string :recipe_rating
     t.integer :user_id
   end
  end
end
