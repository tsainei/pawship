class CreateDogs < ActiveRecord::Migration[6.1]
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :personality
      t.string :gender
      t.string :sex_orientation
      t.string :training_status
      t.string :breed
      t.string :address
      t.string :hobbies
      t.integer :age
      t.boolean :has_breed_certificate
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
