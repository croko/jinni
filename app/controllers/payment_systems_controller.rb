class PaymentSystemsController < ApplicationController
  before_action :set_payment_system, only: [:show, :edit, :update, :destroy]

  # GET /payment_systems
  # GET /payment_systems.json
  def index
    @payment_systems = PaymentSystem.all
  end

  # GET /payment_systems/1
  # GET /payment_systems/1.json
  def show
  end

  # GET /payment_systems/new
  def new
    @payment_system = PaymentSystem.new
  end

  # GET /payment_systems/1/edit
  def edit
  end

  # POST /payment_systems
  # POST /payment_systems.json
  def create
    @payment_system = PaymentSystem.new(payment_system_params)

    respond_to do |format|
      if @payment_system.save
        format.html { redirect_to @payment_system, notice: 'Payment system was successfully created.' }
        format.json { render :show, status: :created, location: @payment_system }
      else
        format.html { render :new }
        format.json { render json: @payment_system.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payment_systems/1
  # PATCH/PUT /payment_systems/1.json
  def update
    respond_to do |format|
      if @payment_system.update(payment_system_params)
        format.html { redirect_to @payment_system, notice: 'Payment system was successfully updated.' }
        format.json { render :show, status: :ok, location: @payment_system }
      else
        format.html { render :edit }
        format.json { render json: @payment_system.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payment_systems/1
  # DELETE /payment_systems/1.json
  def destroy
    @payment_system.destroy
    respond_to do |format|
      format.html { redirect_to payment_systems_url, notice: 'Payment system was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment_system
      @payment_system = PaymentSystem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_system_params
      params.require(:payment_system).permit(:name, :foundation_id, :user_id, :public_key, :private_key, :active)
    end
end
