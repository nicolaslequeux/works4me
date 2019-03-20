class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :category
      t.text :description
      t.integer :price
      t.string :address
      t.string :status, default: "pending"
      t.string :picture
      t.integer :owner_user_id
      t.integer :worker_user_id

      t.timestamps
    end
    add_index :tasks, :owner_user_id
    add_index :tasks, :worker_user_id
  end
end
