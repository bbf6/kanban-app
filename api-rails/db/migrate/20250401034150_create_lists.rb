class CreateLists < ActiveRecord::Migration[8.0]
  def change
    create_table :lists do |t|
      t.string :title, null: false, limit: 100
      t.integer :index, null: false
      t.references :color, null: false, foreign_key: true
      t.references :board, null: false, foreign_key: true
      t.boolean :active, null: false, default: true

      t.timestamps
    end
  end
end
