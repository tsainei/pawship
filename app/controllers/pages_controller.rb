class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    if current_user.dog.nil?
      redirect_to new_dog_path
    else
      redirect_to dogs_path
    end
  end

end
