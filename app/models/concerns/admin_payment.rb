module AdminPayment
  extend ActiveSupport::Concern

  included do
    rails_admin do
      list do
        field :id
        field :project
        field :created_at
        field :amount
        field :sender_phone
        field :payment_transaction
        field :liqpay_order_id
        field :payment_status
        field :payment_type
        field :commission
        field :currency
        field :payment_gateway

      end
      exclude_fields :updated_at
    end
  end
end