class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.new(favorite_params)
    @favorite.save
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    # redirect_to favorites_path
  end

  private

  def favorite_params
    params.require(:favorite).permit(:user)
  end
end
