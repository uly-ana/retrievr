class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    # @top_places = # sorted places by its avg rating
  end
end
