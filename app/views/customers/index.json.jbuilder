json.array!(@customers) do |customer|
  json.extract! customer, :id, :firstname, :lastname, :address1, :address2, :city, :state, :zipcode
  json.url customer_url(customer, format: :json)
end
