json.array!(@payment_gateways) do |payment_gateway|
  json.extract! payment_gateway, :id, :name, :active
  json.url payment_gateway_url(payment_gateway, format: :json)
end
