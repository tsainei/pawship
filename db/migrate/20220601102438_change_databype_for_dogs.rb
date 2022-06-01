class ChangeDatabypeForDogs < ActiveRecord::Migration[6.1]
  def change
    change_table :dogs do |t|
      t.change :birthday, :date, using: 'birthday::date'
    end
  end
end
