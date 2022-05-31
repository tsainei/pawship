class DropSwipedDogId < ActiveRecord::Migration[6.1]
  def change
    remove_column :swipes, :dog_id
  end
end
