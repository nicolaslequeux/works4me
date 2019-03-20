class AddIsAvailableToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :is_available, :boolean, default: false
  end
end
