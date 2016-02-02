class CorrectProductIdColumn < ActiveRecord::Migration
  def change
    remove_column :categorized_products, :integer, :string
    change_column :categorized_products, :product_id, :integer
  end
end
