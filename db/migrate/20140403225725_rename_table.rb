class RenameTable < ActiveRecord::Migration
  def change
    rename_table :recipes_ratings, :ratings_recipes
  end
end
