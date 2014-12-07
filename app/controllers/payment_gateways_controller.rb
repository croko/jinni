class PaymentGatewaysController < ApplicationController
  before_action :set_payment_gateway, only: [:show, :edit, :update, :destroy]

  # GET /payment_gateways
  # GET /payment_gateways.json
  def index
    @payment_gateways = PaymentGateway.all
  end

  # GET /payment_gateways/1
  # GET /payment_gateways/1.json
  def show
  end

  # GET /payment_gateways/new
  def new
    @payment_gateway = PaymentGateway.new
  end

  # GET /payment_gateways/1/edit
  def edit
  end

  # POST /payment_gateways
  # POST /payment_gateways.json
  def create
    @payment_gateway = PaymentGateway.new(payment_gateway_params)

    respond_to do |format|
      if @payment_gateway.save
        format.html { redirect_to @payment_gateway, notice: 'Payment gateway was successfully created.' }
        format.json { render :show, status: :created, location: @payment_gateway }
      else
        format.html { render :new }
        format.json { render json: @payment_gateway.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payment_gateways/1
  # PATCH/PUT /payment_gateways/1.json
  def update
    respond_to do |format|
      if @payment_gateway.update(payment_gateway_params)
        format.html { redirect_to @payment_gateway, notice: 'Payment gateway was successfully updated.' }
        format.json { render :show, status: :ok, location: @payment_gateway }
      else
        format.html { render :edit }
        format.json { render json: @payment_gateway.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payment_gateways/1
  # DELETE /payment_gateways/1.json
  def destroy
    @payment_gateway.destroy
    respond_to do |format|
      format.html { redirect_to payment_gateways_url, notice: 'Payment gateway was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment_gateway
      @payment_gateway = PaymentGateway.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_gateway_params
      params.require(:payment_gateway).permit(:name, :active)
    end
end
