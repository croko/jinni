json.array!(@projects) do |project|
  json.extract! project, :id, :title, :goal, :about, :user_id, :foundation_id, :payment_system_id, :status, :date_start, :date_end, :category_id, :amount
  json.url project_url(project, format: :json)
end
