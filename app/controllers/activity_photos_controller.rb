class ActivityPhotosController < ApplicationController
  def create
    @activity_photo = ActivityPhoto.new(activity_photo_params)
    @activity = Activity.find(params[:activity_id])
    @activity_photo.activity = @activity
    authorize @activity_photo

    if @activity_photo.save
      redirect_to activity_path(@activity)
    else
      render 'activities/show'
    end
  end

  private

  def activity_photo_params
    params.require(:activity_photo).permit(:photo)
  end
end
