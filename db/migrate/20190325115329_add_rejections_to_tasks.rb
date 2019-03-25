class AddRejectionsToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :rejections, :integer, array: true, default: []
  end
end
