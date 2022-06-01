class RenameDatanameForDogs < ActiveRecord::Migration[6.1]
  def change
    rename_column :dogs, :age, :birthday
  end
end
