class AddAreaToMenber < ActiveRecord::Migration[6.1]
  def change
    remove_column :menbers, :area, :integer
    add_column :menbers, :area, :integer, null: false, default: 0
  end
end
