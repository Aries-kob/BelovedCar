class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      
      t.integer :menber_id, null: false
      t.string :title, null: false
      t.string :introduction, null: false

      t.timestamps
    end
  end
end
