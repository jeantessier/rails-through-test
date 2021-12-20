class AddColumnsToWorker < ActiveRecord::Migration[6.1]
  def change
    add_column :workers, :rate, :float
    add_column :workers, :hours, :float
  end
end
