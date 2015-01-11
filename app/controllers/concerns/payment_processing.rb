module PaymentProcessing
  extend ActiveSupport::Concern

  def liqpay_form
    if @project.payment_system_id.present?
      Liqpay.default_options = {
          public_key: @project.payment_system.public_key,
          private_key: @project.payment_system.private_key,
          language: 'ru'
      }
    else
      payment_system = @project.foundation.payment_systems.active.first
      Liqpay.default_options = {
          public_key: payment_system.public_key,
          private_key: payment_system.private_key,
          language: 'ru'
      }
    end


    @liqpay_request = Liqpay::Request.new(
        amount: '1000',
        currency: 'UAH',
        order_id: SecureRandom.urlsafe_base64(nil, true).to_s + @project.id.to_s,
        description: @project.title,
        type: 'donate',
        result_url: project_url(@project),
        server_url: liqpay_callback_url
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