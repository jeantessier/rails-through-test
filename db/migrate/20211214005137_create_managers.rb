class CreateManagers < ActiveRecord::Migration[6.1]
  def change
    create_table :managers do |t|
      t.references :director, null: false, foreign_key: true

      t.timestamps
    end
  end
end
