class AddSomeToProducts < ActiveRecord::Migration
  def change
    add_column :products, :sell_quantity, :integer
  end
end
