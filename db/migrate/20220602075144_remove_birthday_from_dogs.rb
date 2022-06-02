class RemoveBirthdayFromDogs < ActiveRecord::Migration[6.1]
  def change
    remove_column :dogs, :birthday
  end
end
