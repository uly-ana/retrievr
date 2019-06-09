class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    # @favorite = Favorite.new(favorite_params)
    @favorite = Favorite.new
    @user = current_user
    @activity = Activity.find(params[:activity_id])
    @place = @activity.place
    @favorite.activity = @activity
    @favorite.place = @place
    @favorite.user = @user
    authorize @favorite

    @favorite.save ? flash[:notice] = 'Added to favorites' : flash[:error] = 'Error!'
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    redirect_to favorites_path
  end

  # private

  # def favorite_params
  #   params.require(:favorite).permit(:user, :activity, :place)
  # end
end
