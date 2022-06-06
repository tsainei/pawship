class AddSeenToSwipes < ActiveRecord::Migration[6.1]
  def change
    add_column :swipes, :seen, :boolean, default: false
  end
end
