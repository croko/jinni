json.array!(@addresses) do |address|
  json.extract! address, :id, :phone_number, :mobile_1, :mobile_2, :city, :address_1, :address_2, :addressable_id, :addressable_type, :email, :website_url
  json.url address_url(address, format: :json)
end
