class CreateCarGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :car_genres do |t|
      
      t.integer :car_id, null: false
      t.integer :genre_id, null: false

      t.timestamps
    end
  end
end
