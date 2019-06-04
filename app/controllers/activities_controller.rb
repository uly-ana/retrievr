class ActivitiesController < ApplicationController
  def index
    @activites = Activity.all
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.user = @user
    if @activity.save
      redirect_to activity_path(@activity)
    else
      render :new
    end
  end

  def new
    @activity = Activity.new
  end

  def destroy
    @user = current_user
    @activity = Activity.find(params[:id])
    if Activity.destroy
      redirect_to activity_path
    else
      render :index
    end
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])
    @activity.update(activity_params)
  end

  private

  def user
    @user = current_user
  end

  def activity_params
    params.require(:activity).permit(:name, :description, :category)
  end
end
