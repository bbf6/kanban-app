class CreateCompanies < ActiveRecord::Migration[8.0]
  def change
    create_table :companies do |t|
      t.string :name, null: false, limit: 200
      t.text :description, null: true, limit: 2000
      t.boolean :active, null: false, default: true

      t.timestamps
    end
  end
end
