class InstrumentsController < ApplicationController
  before_action :set_instrument, only: [:show, :edit, :update, :destroy]

  def index
    @instruments = Instrument.all
  end

  def show
    authorize @instrument
  end

  def new
    @instrument = Instrument.new
    authorize @instrument
  end

  def create
    @instrument = Instrument.new(instrument_params)
    @instrument.user = current_user
    authorize @instrument

    if @instrument.save!
      redirect_to instrument_path(@instrument)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @instrument.update(instrument_params)
      redirect_to instrument_path(@instrument), notice: 'Instrument was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @garden.destroy
    redirect_to instruments_path, notice: 'Instrument was successfully destroyed.'
  end

  private

  def set_instrument
    @instrument = Instrument.find(params[:id])
  end

  def instrument_params
    params.require(:instrument).permit(:description, :pickup_address, :category, :price_per_day, :user_id)
  end
end
