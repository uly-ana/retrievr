class DogsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @dogs = policy_scope(Dog).order(name: :asc)
  end

  def new
    @dog = Dog.new
    @user = current_user
    @dog.user = @user
    @dog_size = ['1. Lowest pet-friendliness', '2. Below average pet-friendliness', '3. Average pet-friendliness', '4. Exceptional pet-friendliness', '5. Dogs have near-human status']
    authorize @dog
  end

  def create
    @dog = Dog.new(dog_params)
    @user = current_user
    @dog.user = @user
    authorize @dog
    if @dog.save
      redirect_to profile_path(@user)
    else
      render :new
    end
  end

  def destroy
    @dog = Dog.find(params[:id])
    authorize @dog
    if @dog.destroy
      redirect_to profile_path(current_user)
    else
      render :new
    end
  end

  def edit
    @dog = Dog.find(params[:id])
    @dog_size = ['1. Lowest pet-friendliness', '2. Below average pet-friendliness', '3. Average pet-friendliness', '4. Exceptional pet-friendliness', '5. Dogs have near-human status']
    @user = current_user
    authorize @dog
  end

  def update
    @dog = Dog.find(params[:id])
    @dog.update(dog_params)
    authorize @dog
    if @dog.save
      redirect_to profile_path(current_user)
    else
      render :edit
    end
  end

  private

  def dog_params
    params.require(:dog).permit(:photo, :name, :my_story)
  end
end
