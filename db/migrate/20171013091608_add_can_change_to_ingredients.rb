class AddCanChangeToIngredients < ActiveRecord::Migration[5.0]
  def change
    add_column :ingredients, :can_change, :boolean
  end
end
