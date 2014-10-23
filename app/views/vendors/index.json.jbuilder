json.array!(@vendors) do |vendor|
  json.extract! vendor, :id, :vendorname, :itemname, :pricepunit, :address1, :address2, :city, :state, :zipcode
  json.url vendor_url(vendor, format: :json)
end
