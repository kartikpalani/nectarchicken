class CreateFixedAssets < ActiveRecord::Migration
  def change
    create_table :fixed_assets do |t|
      t.integer :asset_cost
      t.integer :asset_loan
      t.integer :asset_paid

      t.timestamps
    end
  end
end
