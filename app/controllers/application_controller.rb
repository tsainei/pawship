class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private

  def after_sign_in_path_for(resource)

    if resource == current_user.dog.nil?
      new_dog_path
    else
      dogs_path
    end
  end
end
