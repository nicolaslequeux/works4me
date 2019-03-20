class AddPriceToTasks < ActiveRecord::Migration[5.2]
  def change
    add_monetize :tasks, :price, currency: { present: false }
  end
end
