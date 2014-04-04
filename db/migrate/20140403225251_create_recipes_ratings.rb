class CreateRecipesRatings < ActiveRecord::Migration
  def change
    create_table :recipes_ratings do |t|
      t.integer :recipe_id
      t.integer :rating_id

      t.timestamps
    end
    remove_column :ratings, :recipe_id
  end
end
