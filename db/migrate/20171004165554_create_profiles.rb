class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :user_name
      t.integer :age
      t.string :first_name
      t.string :last_name
      t.string :photo
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
