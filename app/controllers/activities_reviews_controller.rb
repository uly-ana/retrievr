class ActivitiesReviewsController < ApplicationController
  def index
    @activity_reviews = ActivityReview.all
  end

  def show
    @activity_review = ActivityReview.find(params[:id])
  end

  def create
    @activity_review = ActivityReview.new(activity_review_params)
    @activity_review.save
  end

  def new
    @activity_review = ActivityReview.new
  end

  def destroy
    @activity_review = ActivityReview.find(params[:id])
    ActivityReview.destroy
  end

  private

  def activity_review_params
    params.require(:activity_review).permit(:name, :description)
  end
end
