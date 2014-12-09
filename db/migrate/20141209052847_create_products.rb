class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :costprice
      t.decimal :sellprice
      t.integer :vendor_id
      t.integer :customer_id

      t.timestamps
    end
  end
end
