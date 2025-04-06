class CreateColors < ActiveRecord::Migration[8.0]
  def change
    create_table :colors do |t|
      t.string :hex, null: false, limit: 6
    end
  end
end
