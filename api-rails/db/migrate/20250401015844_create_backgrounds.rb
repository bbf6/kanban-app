class CreateBackgrounds < ActiveRecord::Migration[8.0]
  def change
    create_table :backgrounds do |t|
      t.string :name, null: true, limit: 200
      t.references :company, null: true, foreign_key: true
      t.boolean :active, null: false, default: true

      t.timestamps
    end
  end
end
