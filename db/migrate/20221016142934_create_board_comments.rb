class CreateBoardComments < ActiveRecord::Migration[6.1]
  def change
    create_table :board_comments do |t|
      
      t.text :body, null: false
      t.integer :menber_id, null: false
      t.integer :board_id, null: false

      t.timestamps
    end
  end
end
