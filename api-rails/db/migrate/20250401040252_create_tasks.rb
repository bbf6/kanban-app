class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.string :title, null: false, limit: 300
      t.string :description, null: false, limit: 500
      t.datetime :estimate_date, null: true
      t.datetime :limit_date, null: true
      t.references :list, null: false, foreign_key: true
      t.integer :index, null: false
      t.boolean :active, null: false, default: true

      t.timestamps
    end
  end
end
