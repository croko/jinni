module PaymentProcessing
  extend ActiveSupport::Concern

  def liqpay_form(project)
    if project.payment_system_id.present?
      Liqpay.default_options = {
          public_key: project.payment_system.public_key,
          private_key: project.payment_system.private_key,
          language: 'ru'
      }
    else
      payment_system = project.foundation.payment_systems.active.first
      Liqpay.default_options = {
          public_key: payment_system.public_key,
          private_key: payment_system.private_key,
          language: 'ru'
      }
    end
    if project.fixed_price
      project_type = 'buy'
      amount = project.amount
    else
      project_type = 'donate'
      amount = '200'
    end

    @liqpay_request = Liqpay::Request.new(
        amount: amount,
        currency: 'UAH',
        order_id: SecureRandom.urlsafe_base64(nil, true).to_s + project.id.to_s,
        description: project.title,
        type: project_type,
        result_url: Rails.application.routes.url_helpers.project_url(host: 'https://jinni.com.ua', id: project.id),
        server_url: Rails.application.routes.url_helpers.liqpay_callback_url(host: 'https://jinni.com.ua')
    )
  end

  def liqpay_payment
    @project = Project.find(params[:order_id].partition('==')[2])
    payment_gateway = PaymentGateway.find_by(name: 'LiqPay')

    if @project.present?
      begin
        Liqpay.default_options = {
            public_key: @project.payment_system.public_key,
            private_key: @project.payment_system.private_key
        }

        liqpay_response = Liqpay::Response.new(params)

        if liqpay_response.success?
          if params[:status] == 'success'
            @project.payments.create(
                commission: params[:receiver_commission],
                sender_phone: params[:sender_phone],
                payment_transaction: params[:transaction_id],
                payment_status: params[:status],
                payment_type: params[:type],
                currency: params[:currency],
                amount_currency: params[:amount],
                liqpay_order_id: params[:liqpay_order_id],
                payment_gateway: payment_gateway
            )
          end
        else
          logger.error "**** Liqpay payment error, project id: #{@project.try(:id)}, sender_phone : #{params[:sender_phone]}, amount: #{params[:amount]}, payment_status: #{params[:status]}, transaction: #{params[:transaction_id]} ****"
        end
      rescue Liqpay::InvalidResponse => e
        logger.error "**** Liqpay InvalidResponse, project id: #{@project.try(:id)}, #{e.message} ****"
      end
    end
  end
end