class CreateRoles < ActiveRecord::Migration[8.0]
  def change
    create_table :roles do |t|
      t.string :name
      t.references :board, null: false, foreign_key: true
      t.boolean :active

      t.timestamps
    end
  end
end
