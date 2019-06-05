class ActivitiesController < ApplicationController
  before_action :user, only: [:create]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @activities = params[:price] ? Activity.order(price_cents: params[:price]) : Activity.all
    @activities = params[:category] ? Activity.where(category: params[:category]) : Activity.all
  end

  def show
    @activity = Activity.find(params[:id])
    authorize @activity
    @activity_photo = ActivityPhoto.new
  end

  def new
    @activity = Activity.new
    @activity_photos = @activity.activity_photos.build
    authorize @activity
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.owner = @user
    @place = Place.find(params[:activity][:place])
    @activity.place = @place
    authorize @activity

    if @activity.save
      params[:activity][:photo].each do |p|
        @activity_photo = @activity.activity_photos.create!(photo: p, activity_id: @activity.id)
      end
      redirect_to activity_path(@activity)
    else
      render :new
    end
  end

  def edit
    @activity = Activity.find(params[:id])
    authorize @activity
  end

  def update
    @activity = Activity.find(params[:id])
    @activity.update(activity_params)
    authorize @activity
  end

  def destroy
    @activity = Activity.find(params[:id])
    authorize @activity

    if @activity.destroy
      redirect_to activities_path
    else
      render :index
    end
  end

  private

  def user
    @user = current_user
  end

  def activity_params
    params.require(:activity).permit(:name, :price, :description, :category, :date, :address, :limit, activity_photos_attributes: [:id, :photo])
  end
end
