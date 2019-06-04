class ActivitiesController < ApplicationController
  def index
    @activites = Activity.all
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.save
  end

  def new
    @activity = Activity.new
  end

  def destroy
    @activity = Activity.find(params[:id])
    Activity.destroy
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])
    @activity.update(params[:activity])
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :description)
  end
end
