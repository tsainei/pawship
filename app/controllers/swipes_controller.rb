class SwipesController < ApplicationController
  def new; end

  def create
    swipe = Swipe.new
    swipe.swiper_dog_id = current_user.dog.id
    swipe.swiped_dog_id = params[:swiped_dog_id]
    swipe.liked = params[:liked]
    swipe.save!
    if swipe.liked &&
         swipe
           .swiped_dog
           .swipes
           .where(liked: true, swiped_dog_id: current_user.dog.id)
           .any?
      redirect_to dogs_path, notice: "It's a match"
    else
      redirect_to dogs_path
    end
  end

  def index
    @swipes =
      swipe.swiped_dog.swipes.where(
        liked: true,
        swiped_dog_id: current_user.dog.id,
      )
  end

  def show
    @swipe = Swipe.find(params[:id])
  end
end
