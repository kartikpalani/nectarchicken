json.array!(@bills) do |bill|
  json.extract! bill, :id, :name, :amount
  json.url bill_url(bill, format: :json)
end
