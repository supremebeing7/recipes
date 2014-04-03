class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.column :name, :string
      t.column :rating, :integer
      t.column :slug, :string

      t.timestamps
    end

    create_table :tags do |t|
      t.column :name, :string
      t.column :slug, :string

      t.timestamps
    end

    create_table :recipe_tags do |t|
      t.column :recipe_id, :integer
      t.column :tag_id, :integer

      t.timestamps
    end

  end
end
