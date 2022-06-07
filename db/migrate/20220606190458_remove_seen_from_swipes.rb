class RemoveSeenFromSwipes < ActiveRecord::Migration[6.1]
  def change
    remove_column :swipes, :seen
  end
end
