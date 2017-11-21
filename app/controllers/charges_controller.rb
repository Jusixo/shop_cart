class ChargesController < ApplicationController
  # GET /charges
  def index
    @charges = Charge.all
  end

  # GET /charges/1
  def show
    @charge = Charge.find(params[:id])
  end

  # GET /charges/new
  def new
    @charge = Charge.new
  end

  # GET /charges/1/edit
  def edit
    @charge = Charge.find(params[:id])
  end

  # POST /charges
  def create
    @charge = Charge.new(charge_params)

    if @charge.save
      redirect_to @charge, notice: 'Charge was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /charges/1
  def update
    @charge = Charge.find(params[:id])
    if @charge.update(charge_params)
      redirect_to @charge, notice: 'Charge was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /charges/1
  def destroy
    @charge = Charge.find(params[:id])
    @charge.destroy
    redirect_to charges_url, notice: 'Charge was successfully destroyed.'
  end

  private

  # Only allow a trusted parameter "white list" through.
  def charge_params
    params.fetch(:charge, {})
  end
end
