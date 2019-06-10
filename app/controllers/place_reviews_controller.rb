class PlaceReviewsController < ApplicationController
  before_action :user, only: [:create]

  def create
    @place_review = PlaceReview.new(place_review_params)
    @place = Place.find(params[:place_id])
    @place_review.place = @place
    @place_review.user = @user
    authorize @place_review

    if @place_review.save
      flash[:notice] = 'Review was successfully created'
      redirect_to places_path(@place)
    else
      flash[:error] = "Error creating review: #{@place_review.errors}"
      render 'places/show'
    end
  end

  private

  def user
    @user = current_user
  end

  def place_review_params
    params.require(:place_review).permit(:rating, :content)
  end
end
