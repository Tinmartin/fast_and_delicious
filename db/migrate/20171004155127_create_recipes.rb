class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :photo
      t.text :description
      t.integer :calories
      t.string :cooking_time
      t.string :preparation_time

      t.timestamps
    end
  end
end
