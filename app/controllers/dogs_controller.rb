class DogsController < ApplicationController
  before_action :set_dog, only: %i[show edit update]
  skip_before_action :authenticate_user!, only: [:index]

  def index
    # @dog =
    #   Dog
    #     .where.not(id: current_user.swipes.select('dog_id'))
    #     .order('RANDOM()')
    #     .first
     @dogs = Dog.all

  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.user = current_user

    if @dog.save
      redirect_to dogs_path, notice: 'Your dog profile was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    @dog.update(dog_params)

    redirect_to dogs_path
  end


  def show
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :age, :gender, :personality, :sex_orientation, :training_status, :breed, :has_breed_certificate, :hobbies, :address, :short_description)
  end

  def set_dog
    @dog = Dog.find(params[:id])
  end
end
