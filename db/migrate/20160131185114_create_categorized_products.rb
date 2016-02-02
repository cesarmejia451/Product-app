class CreateCategorizedProducts < ActiveRecord::Migration
  def change
    create_table :categorized_products do |t|
      t.string :product_id
      t.string :integer
      t.integer :category_id

      t.timestamps 
    end
  end
end
