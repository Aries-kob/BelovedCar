class RemoveBodyFormBoards < ActiveRecord::Migration[6.1]
  def change
    remove_column :boards, :body, :text
  end
end
