class CreateDirectors < ActiveRecord::Migration[6.1]
  def change
    create_table :directors do |t|
      t.references :ceo, null: false, foreign_key: true

      t.timestamps
    end
  end
end
