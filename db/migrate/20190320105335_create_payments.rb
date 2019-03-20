class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.string :state
      t.string :taks_sku
      t.monetize :amount
      t.jsonb :payload
      t.references :task, foreign_key: true

      t.monetize :amount, currency: { present: false }

      t.timestamps
    end
  end
end
