class BandsController < ApplicationController
  def index
    render :index
  end

  def new
    render :new
  end

  def create
    @band = Band.new(name: params[:band][:name])
    if @band.save
      redirect_to band_url(@band)
    else
      flash[:errors].errors.full_messages
      redirect_to new_band_url
    end
  end

  def edit
    render :edit
  end

  def update
    band = Band.find_by(id: params[:id])
    if band
      band.name = params[:band][:name]
      band.save
      redirect_to band_url(band)
    else
      flash[:errors] = band.errors.full_messages
      # Check the solution for the canonical approach.
      redirect_to band_url(band)
    end
  end

  def show
    render :show
  end

end
