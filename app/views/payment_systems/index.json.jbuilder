json.array!(@payment_systems) do |payment_system|
  json.extract! payment_system, :id, :name, :foundation_id, :user_id, :public_key, :private_key, :active
  json.url payment_system_url(payment_system, format: :json)
end
