class AddIndexToMines < ActiveRecord::Migration[8.0]
  def change
    add_index :mines, [:board_id, :x_coor, :y_coor], unique: true
  end
end
