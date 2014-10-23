json.array!(@employees) do |employee|
  json.extract! employee, :id, :firstname, :lastname, :address1, :address2, :city, :state, :zipcode, :ssn, :withholding, :salary
  json.url employee_url(employee, format: :json)
end
