class DogsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @dogs = policy_scope(Dog).order(name: :asc)
  end

  def new
    @dog = Dog.new
    @user = current_user
    @dog.user = @user
    authorize @dog
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.user = current_user
    authorize @dog
    if @dog.save
      render 'users/show'
    else
      render :new
    end
  end

  private

  def dog_params
    params.require(:dog).permit(:photo, :name, :my_story)
  end
end
