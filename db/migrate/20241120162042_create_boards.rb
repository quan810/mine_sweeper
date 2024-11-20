class CreateBoards < ActiveRecord::Migration[8.0]
  def change
    create_table :boards, id: :uuid do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.integer :height, null: false
      t.integer :width, null: false
      t.timestamps
    end
  end
end
