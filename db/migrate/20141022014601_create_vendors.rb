class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :vendorname
      t.string :itemname
      t.float :pricepunit
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.integer :zipcode

      t.timestamps
    end
  end
end
