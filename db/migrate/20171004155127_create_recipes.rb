class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :photo
      t.text :description
      t.time :string
      t.integer :calories

      t.timestamps
    end
  end
end
