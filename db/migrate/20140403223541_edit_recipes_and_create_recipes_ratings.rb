class EditRecipesAndCreateRecipesRatings < ActiveRecord::Migration
  def change
    rename_column :recipes, :content, :directions
    add_column :recipes, :ingredients, :string
    remove_column :recipes, :rating

    create_table :ratings do |t|
      t.integer :recipe_id
      t.integer :rating

      t.timestamps
    end
  end
end
