class CreateLists < ActiveRecord::Migration[8.0]
  def change
    create_table :lists do |t|
      t.string :title, null: false, limit: 100
      t.references :color, null: false, foreign_key: true
      t.references :board, null: false, foreign_key: true
      t.boolean :active

      t.timestamps
    end
  end
end
