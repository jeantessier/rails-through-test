class CreateCeos < ActiveRecord::Migration[6.1]
  def change
    create_table :ceos do |t|

      t.timestamps
    end
  end
end
