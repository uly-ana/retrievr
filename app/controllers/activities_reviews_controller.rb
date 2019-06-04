class ActivitiesReviewsController < ApplicationController
  def index
    @activity_reviews = ActivityReview.all
  end

  def show
    @activity_review = ActivityReview.find(params[:id])
  end

  def create
    @activity_review = ActivityReview.new(activity_review_params)
    @activity_review.user = @user
    if @activity_review.save
      redirect_to activity_review_path(@activity_review)
    else
      render :new
    end
  end

  def new
    @activity_review = ActivityReview.new
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
    @user = current.usser
  end

  def activity_review_params
    params.require(:activity_review).permit(:name, :description)
  end
end
