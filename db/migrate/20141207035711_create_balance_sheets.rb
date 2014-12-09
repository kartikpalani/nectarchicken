class CreateBalanceSheets < ActiveRecord::Migration
  def change
    create_table :balance_sheets do |t|
      t.integer :cash
      t.integer :inventory_total
      t.integer :receivable
      t.integer :payable

      t.timestamps
    end
  end
end
