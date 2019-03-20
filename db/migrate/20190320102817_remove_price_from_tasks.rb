class RemovePriceFromTasks < ActiveRecord::Migration[5.2]
  def change
    remove_column :tasks, :price, :integer
  end
end
