class AddShortDescriptionToDogs < ActiveRecord::Migration[6.1]
  def change
    add_column :dogs, :short_description, :string
  end
end
