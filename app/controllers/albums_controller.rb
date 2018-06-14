class AlbumsController < ApplicationController 
  # before_action :ensure_logged_in, only: [:edit, :new, :delete]
  
  def show 
    @album = Album.find(params[:id])
    render :show
  end 
  
  def new 
    if params[:band_id]
      @band = Band.find(params[:band_id])
    end
    @album = Album.new 
    render :new
  end 
  
  def create
    @album = Album.new(album_params)
    @album.band_id = params[:band_id]
    debugger
    if @album.save 
      redirect_to album_url(@album.id)
    else 
      flash[:error] = @album.errors.full_messages
      if params[:band_id]
        redirect_to band_url(params[:band_id])
      else 
        redirect_to bands_url
      end
    end
  end
  
  def edit 
    @album = Album.find(params[:id])
    render :edit
  end 
  
  def update 
    @album = Album.find(params[:id])
    if @album.update(album_params)
      redirect_to album_url(@album.id)
    else 
      flash[:errors] = album.errors.full_messages
      redirect_to album_url(@album.id)
    end
  end 
  
  def destroy 
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to bands_url
  end
  private 
  def album_params 
    params.require(:albums).permit(:title, :year, :live)
  end
end