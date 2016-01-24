class AddDescriptonAndNameToProducts < ActiveRecord::Migration
  def change
    change_column :products, :description, :text
    change_column :products, :name, :string
    change_column :products, :price, :decimal, precision: 5, scale: 2
  end
end
