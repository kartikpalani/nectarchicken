class RemovePaidDateToEmployee < ActiveRecord::Migration
  def change
    remove_column :employees, :paid_date, :date
  end
end
