class InstrumentsController < ApplicationController
  before_action :set_instrument, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:show, :index]

  def index
    if params[:query].present?
      @instruments = Instrument.where("category ILIKE ?", "%#{params[:query]}%")
      if @instruments.count == 0
        @instruments = Instrument.all
      end
    else
      @instruments = Instrument.all
    end
  end

  def show
  end

  def new
    @instrument = Instrument.new
  end

  def create
    @instrument = Instrument.new(instrument_params)
    @instrument.user_id = params(:user_id)
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
    @instrument.destroy
    redirect_to instruments_path, notice: 'Instrument was successfully deleted.'
  end

  private

  def set_instrument
    @instrument = Instrument.find(params[:id])
  end

  def instrument_params
    params.require(:instrument).permit(:description, :pickup_address, :category, :price_per_day, :user_id)
  end
end
