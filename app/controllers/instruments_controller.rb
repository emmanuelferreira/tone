class InstrumentsController < ApplicationController

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
  end



  def destroy
  end

  private

  def instrument_params
    params.require(:instrument).permit(:description, :pickup_address, :category, :price_per_day, :user_id)
  end
end
