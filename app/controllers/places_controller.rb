class PlacesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @places = policy_scope(Place).order(name: :asc)
  end

  def show
    @place = Place.find(params[:id])
    authorize @place
  end

  def new
    @place = Place.new
    authorize @place
  end

  def create
    @place = Place.new(place_params)
    @user = current_user
    @place.user = @user
    authorize @place

    if @place.save
      flash[:notice] = 'Place successfully created'
      redirect_to place_path(@place)
    else
      render :new
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
    params.require(:place).permit(:name, :category, :dogginess_scale)
  end
end
