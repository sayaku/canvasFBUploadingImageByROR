class PhotoController < ApplicationController
  
  def create
  	
  	
  	@photo = Photo.new(:dataUrl => params['data_value'])
    @photo.save
    
    redirect_to photo_show_path(@photo)
  end

  def show
  	@photo = Photo.find_by(id: params[:format])

  end
end
