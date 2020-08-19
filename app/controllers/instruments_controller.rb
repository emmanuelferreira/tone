class InstrumentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  before_action :set_instrument, only: [:show, :edit, :update, :destroy]


  def index
    if params[:query].present?
      @instruments = Instrument.where("category ILIKE ?", "%#{params[:query]}%")
      if @instruments.count == 0
        @instruments = Instrument.all
      end
    else
      @instruments = Instrument.all
      @instrument_geo = Instrument.geocoded
      @markers = @instrument_geo.map do |instrument|
        {
          lat: instrument.latitude,
          lng: instrument.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { instrument: instrument }),
          image_url: helpers.asset_url('/assets/images/logo-white.png')
        }
      end
    end
  end

  def show
    @markers = [{
          lat: @instrument.latitude,
          lng: @instrument.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { instrument: @instrument }),
          image_url: helpers.asset_url('logo-white.png')
        }]
  end

  def new
    @instrument = Instrument.new
  end

  def create
    @user = current_user
    @instrument = Instrument.new(instrument_params)
    @instrument.user = @user
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
      redirect_to dashboard_path, notice: 'Instrument was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @instrument.destroy
    redirect_to dashboard_path, notice: 'Instrument was successfully removed.'
  end

  private

  def set_instrument
    @instrument = Instrument.find(params[:id])
  end

  def instrument_params
    params.require(:instrument).permit(:description, :pickup_address, :category,
                                       :price_per_day, :user_id, :title, :photo)
  end
end
