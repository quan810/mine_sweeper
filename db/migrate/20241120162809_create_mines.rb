class CreateMines < ActiveRecord::Migration[8.0]
  def change
    create_table :mines, id: :uuid do |t|
      t.integer :x_comp, null: false
      t.integer :y_comp, null: false
      t.uuid    :board_id
      t.timestamps
    end
  end
end
