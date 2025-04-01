class CreateListRoles < ActiveRecord::Migration[8.0]
  def change
    create_table :list_roles do |t|
      t.references :list, null: false, foreign_key: true
      t.references :role, null: false, foreign_key: true
      t.boolean :can_move_in, null: false, default: true
      t.boolean :can_move_out, null: false, default: true
      t.boolean :can_create, null: false, default: true
      t.boolean :can_edit, null: false, default: true
      t.boolean :can_delete, null: false, default: true

      t.timestamps
    end
  end
end
