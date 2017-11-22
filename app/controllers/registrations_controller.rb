class RegistrationsController < ApplicationController
  # GET /registrations
  def index
    @registrations = Registration.all
  end

  # GET /registrations/1
  def show
    @registration = Registration.find(params[:id])
  end

  # GET /registrations/new
  def new
    @registration = Registration.new
  end

  # GET /registrations/1/edit
  def edit
    @registration = Registration.find(params[:id])
  end

  # POST /registrations
  def create
      @registration = Registration.new registration_params.merge(email: stripe_params["stripeEmail"],
                                                                 card_token: stripe_params["stripeToken"])
      raise "Please, check registration errors" unless @registration.valid?
      @registration.process_payment
      @registration.save
      redirect_to @registration, notice: 'Registration was successfully created.'
    rescue e
      flash[:error] = e.message
      render :new
    end

  # PATCH/PUT /registrations/1
  def update
    @registration = Registration.find(params[:id])
    if @registration.update(registration_params)
      redirect_to @registration, notice: 'Registration was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /registrations/1
  def destroy
    @registration = Registration.find(params[:id])
    @registration.destroy
    redirect_to registrations_url, notice: 'Registration was successfully destroyed.'
  end

  private

  # Only allow a trusted parameter "white list" through.
  def registration_params
    params.fetch(:registration, {})
  end

  def stripe_params
    params.permit :stripeEmail, :stripeToken
  end
end
