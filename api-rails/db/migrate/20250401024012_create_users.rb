class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :name, null: false, limit: 100
      t.string :last_name, null: true, limit: 100
      t.string :nickname, null: true, limit: 100
      t.string :email, null: false, limit: 100
      t.string :password_digest, null: false, limit: 72
      t.boolean :admin, null: false, default: false
      t.references :company, null: false, foreign_key: true
      t.boolean :active, null: false, default: true

      t.timestamps
    end
  end
end
