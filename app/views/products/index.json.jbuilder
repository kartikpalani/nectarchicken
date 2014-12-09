json.array!(@products) do |product|
  json.extract! product, :id, :name, :costprice, :sellprice, :vendor_id, :customer_id, :quantity
  json.url product_url(product, format: :json)
end
