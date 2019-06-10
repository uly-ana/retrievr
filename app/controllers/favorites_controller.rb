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

    respond_to do |format|
      format.html

      format.js do
        render :create
      end
    end

  end

  def destroy
    @activity = Activity.find(params[:activity_id])
    @favorite = Favorite.find(params[:id])
    authorize @favorite
    @favorite.destroy

    respond_to do |format|
      format.html

      format.js do
        render :delete
      end
    end

  end

  # private

  # def favorite_params
  #   params.require(:favorite).permit(:user, :activity, :place)
  # end
end
