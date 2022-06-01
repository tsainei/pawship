class AddBirthdayToDogs < ActiveRecord::Migration[6.1]
  def change
    add_column :dogs, :birthday, :date
  end
end
