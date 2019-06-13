class ActivityReviewsController < ApplicationController
  before_action :user, only: [:create]

  def new
    @activity_review = ActivityReview.new
  end

  def create
    @activity_review = ActivityReview.new(activity_review_params)
    @activity = Activity.find(params[:activity_id])
    @activity_review.activity = @activity
    @activity_review.user = @user
    authorize @activity_review

    if @activity_review.save
      flash[:notice] = 'Review was successfully created.'
      redirect_to activity_path(@activity)
    else
      flash[:error] = "Error creating review: #{@activity_review.errors}"
      render 'activities/show'
    end
  end

  def destroy
    @activity_review = ActivityReview.find(params[:id])
    if ActivityReview.destroy
      redirect_to activity_review_path
    else
      render :index
    end
  end

  private

  def user
    @user = current_user
  end

  def activity_review_params
    params.require(:activity_review).permit(:rating, :content)
  end
end
