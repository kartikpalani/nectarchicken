class BalanceSheetsController < ApplicationController
  before_action :set_balance_sheet, only: [:show, :edit, :update, :destroy]

  # GET /balance_sheets
  # GET /balance_sheets.json
  def index
    @balance_sheets = BalanceSheet.all
  end

  def incomestatement
    @balance_sheets = BalanceSheet.all
    @profit = $sales - $cogs
    @expenses = $payroll + $withholding + $bills
    @op_income = @profit - @expenses
    @tax = 0.2 * @op_income
    @net_income = @op_income - @tax
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_balance_sheet
      @balance_sheet = BalanceSheet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def balance_sheet_params
      params.require(:balance_sheet).permit(:cash, :inventory_total, :receivable, :payable)
    end
end
