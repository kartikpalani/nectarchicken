class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.string :type
      t.decimal :amount

      t.timestamps
    end
  end
end
