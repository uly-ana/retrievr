class ActivitiesController < ApplicationController
  before_action :user, only: [:create]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @favorite = Favorite.new
    @params = params

    respond_to do |format|
      format.html do
        @activities = Activity.all
        render :index
      end

      format.js do
        if params[:price].present?
          @activities = Activity.order(price_cents: params[:price])
        elsif params[:category].present?
          @activities = Activity.where(category: params[:category])
        else
          @activities = Activity.all
        end
      end
    end
  end

  def show
    @user = current_user
    @activity = Activity.find(params[:id])
    authorize @activity
    @activity_review = ActivityReview.new
  end

  def new
    @activity = Activity.new
    @activity_photos = @activity.activity_photos.build
    authorize @activity
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.owner = @user
    @activity_photos = @activity.activity_photos.build
    # @place = Place.find(params[:activity][:place])
    # @activity.place = @place
    authorize @activity

    if @activity.save
      params[:activity][:photo].each do |p|
        @activity_photo = @activity.activity_photos.create!(photo: p, activity_id: @activity.id)
      end
      redirect_to activity_path(@activity)
    else
      # @activity_photos = @activity.activity_photos.build
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
