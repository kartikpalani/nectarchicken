class AddPaidDateToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :paid_date, :date
  end
end
