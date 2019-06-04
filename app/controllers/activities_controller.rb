class ActivitiesController < ApplicationController
  before_action :user, only: [:create]

  def index
    @activities = Activity.all
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def new
    @activity = Activity.new
    authorize @activity
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.owner = @user
    @place = Place.find(params[:activity][:place])
    @activity.place = @place
    authorize @activity

    if @activity.save
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
    # @user = current_user
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
    params.require(:activity).permit(:name, :description, :category, :date, :address, :limit)
  end
end
