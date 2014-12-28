class PaymentsController < ApplicationController
  skip_before_action :require_login
  protect_from_forgery except: :liqpay_callback
  include PaymentProcessing

  def liqpay_callback
    liqpay_payment
    render text: "Processed", status: '200 OK'
  end


end
