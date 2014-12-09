json.array!(@balance_sheets) do |balance_sheet|
  json.extract! balance_sheet, :id, :cash, :inventory_total, :receivable, :payable
  json.url balance_sheet_url(balance_sheet, format: :json)
end
