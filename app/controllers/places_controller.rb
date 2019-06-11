class PlacesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @places = policy_scope(Place)

    if params[:search].present?
      @places = Place.near(params[:search])
    else
      @places = Place.all
    end

    @markers = @places.map do |place|
      {
        lat: place.latitude,
        lng: place.longitude,
        infoWindow: render_to_string(partial: 'infowindow', locals: { place: place })
      }
    end
  end

  def show
    @place = Place.find(params[:id])
    @place_review = PlaceReview.new
    authorize @place
  end

  def new
    @place = Place.new
    @place_photos = @place.place_photos.build
    authorize @place
  end

  def create
    @place = Place.new(place_params)
    @user = current_user
    @place.user = @user
    authorize @place

    if @place.save
      params[:place][:photo].each do |p|
        @place_photo = @place.place_photos.create!(photo: p, place_id: @place.id)
      end

      redirect_to place_path(@place)
    end
  end

  def edit
    @place = Place.find(params[:id])
    authorize @place
  end

  def update
    @place = Place.find(params[:id])
    @place.update(place_params)
    authorize @place

    if @place.save
      redirect_to place_path(@place)
    else
      render :edit
    end
  end

  def destroy
    @place = Place.find(params[:id])
    authorize @place

    if @place.destroy
      flash[:notice] = 'Place successfully deleted'
      redirect_to places_path
    end
  end

  private

  def place_params
    params.require(:place).permit(:name, :category, :dogginess_scale, place_photos_attributes: [:id, :photo])
  end
end
