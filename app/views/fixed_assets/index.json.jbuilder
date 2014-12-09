json.array!(@fixed_assets) do |fixed_asset|
  json.extract! fixed_asset, :id, :asset_name, :asset_cost, :asset_loan, :asset_paid
  json.url fixed_asset_url(fixed_asset, format: :json)
end
