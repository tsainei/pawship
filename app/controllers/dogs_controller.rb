class DogsController < ApplicationController
  def index
    @dog =
      Dog
        .where.not(id: current_user.swipes.select('dog_id'))
        .order('RANDOM()')
        .first
  end

  def new; end

  def create; end

  def update; end

  def edit; end

  def show; end
end
