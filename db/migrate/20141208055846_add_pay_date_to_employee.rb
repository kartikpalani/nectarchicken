class AddPayDateToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :pay_date, :date
  end
end
