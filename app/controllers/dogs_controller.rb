class DogsController < ApplicationController
  def index
    @dogs = Dog.all
  end

  def new
    @dog = Dog.new
    @user = current_user
    @dog.user = @user
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.user = current_user
    if @dog.save
      render "users/show", status: :created
    else
      render :new
    end
  end

  private

  def dog_params
    params.require(:dog).permit(:photo, :name, :my_story)
  end
end
