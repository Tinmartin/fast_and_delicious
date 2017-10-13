class AddQuoteToProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :quote, :string
  end
end
