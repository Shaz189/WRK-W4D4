class BandsController < ApplicationController 
  # before_action :ensure_logged_in, only: [:edit, :new, :delete]
  def index
    @bands = Band.all 

  end
  
  def show 
    @band = Band.find(params[:id])
    render :show
  end 
  
  def new 
    @band = Band.new 
    render :new
  end 
  
  def create
    @band = Band.new(band_params)
    if @band.save 
      redirect_to band_url(@band.id)
    else 
      flash[:error] = @band.errors.full_messages
      redirect_to bands_url
    end
  end
  
  def edit 
    @band = Band.find(params[:id])
    render :edit
  end 
  
  def update 
    @band = Band.find(params[:id])
    if @band.update(band_params)
      redirect_to band_url(@band.id)
    else 
      flash[:errors] = band.errors.full_messages
      redirect_to band_url(@band.id)
    end
  end 
  
  def destroy 
    @band = Band.find(params[:id])
    @band.destroy
    redirect_to bands_url
  end
  private 
  def band_params 
    params.require(:bands).permit(:name)
  end
end