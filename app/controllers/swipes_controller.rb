class SwipesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
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
           .likes
           .where(swiped_dog_id: current_user.dog.id)
           .any?
      matched = true
    else
      matched = false
    end
    path = swipe_path(swipe)
    render json: { matched: matched, path: path }
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

