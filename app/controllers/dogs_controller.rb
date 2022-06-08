class DogsController < ApplicationController
  before_action :set_dog, only: %i[show edit update]
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @dogs = Dog.order(current_user&.demo? ? 'id DESC' : 'RANDOM()')
    # if current_user&.dog
    #   dogs =
    #     dogs
    #       .where.not(id: current_user.dog.swipes.select('swiped_dog_id'))
    #       .where.not(id: current_user.dog.id)
    # end
    if current_user&.dog
    @dogs =
        @dogs
          .where.not(id: current_user.dog.swipes.select('swiped_dog_id'))
          .where.not(id: current_user.dog.id)
    end
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.user = current_user

    if @dog.save
      redirect_to dogs_path,
                  notice: 'Your dog profile was successfully created.'
    else
      render :new
    end
  end

  def edit
    @dog.user = current_user
  end

  def update
    if @dog.update(dog_params)
      redirect_to dogs_path
    else
      render :edit
    end
  end

  def show
    @markers =
    [{
      lat: @dog.latitude,
      lng: @dog.longitude,
      info_window:
        render_to_string(
          partial: 'info_window',
          locals: {
          dog: @dog,
          },
      ),
      image_url: helpers.asset_url('paw-marker.png'),
    }]
  end

  private

  def dog_params
    params
      .require(:dog)
      .permit(
        :name,
        :age,
        :gender,
        :personality,
        :sex_orientation,
        :training_status,
        :breed,
        :has_breed_certificate,
        :hobbies,
        :address,
        :short_description,
        :photo
      )
  end

  def set_dog
    @dog = Dog.find(params[:id])
  end
end
