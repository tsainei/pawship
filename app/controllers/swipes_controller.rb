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
           .swipes.likes
           .where(swiped_dog_id: current_user.dog.id)
           .any?
           redirect_to swipes_path(swipe.swiped_dog_id)
    else
      redirect_to dogs_path
    end
  end

  def index
    @swipes =
      current_user.dog.swipes.where(
        liked: true,
        swiped_dog_id: current_user.dog.swipers.likes.select('swiper_dog_id'),
      )
      @dogs = Dog.where(id: @swipes.map(&:swiped_dog_id))
  end

  def show
    @swipe = Swipe.find(params[:id])
    @swiped_dog = Dog.find(@swipe.swiped_dog_id)
    @swiper_dog = Dog.find(@swipe.swiper_dog_id)
  end
end
