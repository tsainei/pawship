class RenameDatatypeForSwipe < ActiveRecord::Migration[6.1]
  change_table :swipes do |t|
    t.change :swiped_dog_id, :integer, using: 'swiped_dog_id::integer'
    t.change :swiper_dog_id, :integer, using: 'swiper_dog_id::integer'
  end
end
