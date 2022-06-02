class AddAgeToDogs < ActiveRecord::Migration[6.1]
  def change
    add_column :dogs, :age, :string
  end
end
