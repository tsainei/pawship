class CreateSwipes < ActiveRecord::Migration[6.1]
  def change
    create_table :swipes do |t|
      t.boolean :liked
      t.string :swiper_dog_id
      t.string :swiped_dog_id
      t.references :dog, null: false, foreign_key: true

      t.timestamps
    end
  end
end
