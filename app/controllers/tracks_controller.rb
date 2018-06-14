class TracksController < ApplicationController 
  # before_action :ensure_logged_in, only: [:edit, :new, :delete]
  
  def show 
    @track = Track.find(params[:id])
    render :show
  end 
  
  def new 
    if params[:album_id]
      @album = Album.find(params[:album_id])
    end
    @track = Track.new 
    render :new
  end 
  
  def create
    @track = Track.new(track_params)
    @track.album_id = params[:album_id]
    @album = Album.find(params[:album_id])
    @track.band_id = @album.band_id
    if @track.save 
      redirect_to track_url(@track.id)
    else 
      flash[:error] = @track.errors.full_messages
      if params[:album_id]
        redirect_to album_url(params[:album_id])
      else 
        redirect_to albums_url
      end
    end
  end
  
  def edit 
    @track = Track.find(params[:id])
    render :edit
  end 
  
  def update 
    @track = Track.find(params[:id])
    if @track.update(track_params)
      redirect_to track_url(@track.id)
    else 
      flash[:errors] = track.errors.full_messages
      redirect_to track_url(@track.id)
    end
  end 
  
  def destroy 
    @track = Track.find(params[:id])
    @track.destroy
    redirect_to albums_url
  end
  private 
  def track_params 
    params.require(:tracks).permit(:title, :year, :live)
  end
end