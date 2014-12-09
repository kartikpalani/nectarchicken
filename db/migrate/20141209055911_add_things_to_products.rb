class AddThingsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :amt_paid, :decimal
    add_column :products, :amt_debt, :decimal
    add_column :products, :amt_sold, :decimal
    add_column :products, :amt_loaned, :decimal
  end
end
