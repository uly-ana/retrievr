class FavoritesController < ApplicationController
  def create
    @favorites = Favorite.new(params[:favorite])
    @favorites.save
  end

  def destroy
    @favorites = Favorite.find(params[:id])
    Favorite.destroy
    # redirect_to favorites_path
  end
end
