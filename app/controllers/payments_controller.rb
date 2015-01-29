class PaymentsController < ApplicationController
  skip_before_action :require_login, only: :liqpay_callback
  protect_from_forgery except: :liqpay_callback
  include PaymentProcessing

  def liqpay_callback
    liqpay_payment
    render text: "Processed", status: '200 OK'
  end

  def create
    project = current_user.projects.friendly.find(params[:project_id])
    @payment = project.payments.build(payment_params)

    respond_to do |format|
      if @payment.save
        @success = true
        format.js {}
      else
        flash.now.alert = @payment.errors.messages.map { |k, v| v }.flatten.to_sentence
        format.js {}
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_params
      params.require(:payment).permit(:currency, :amount_currency)
    end

end
