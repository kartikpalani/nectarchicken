class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  $cash = 100000
  $asset_loan_total = 0
  $asset_cost_total = 0
  $payroll = 0
  $withholding = 0
  $cogs = 0
  $sales = 0
  $bills = 0
  $receivable = 0
  $payable = 0
  $inventory_total = 0
end
