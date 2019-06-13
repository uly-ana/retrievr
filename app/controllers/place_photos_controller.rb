class PlacePhotosController < ApplicationController
  def create
    @place_photo = PlacePhoto.new(place_photos_params)
    @place = Place.find(params[:place_id])
    @place_photo.place = @place
    authorize @place_photo

    if @place_photo.save
      redirect_to place_path(@place)
    else
      render 'places/show'
    end
  end

  private

  def place_photos_params
    params.require(:place_photo).permit(:photo)
  end
end
