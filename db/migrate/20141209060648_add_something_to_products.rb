class AddSomethingToProducts < ActiveRecord::Migration
  def change
    add_column :products, :buy_quantity, :integer
  end
end
