class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.integer :amount
      t.string :status
      t.references :task, foreign_key: true
      t.jsonb :payload

      t.timestamps
    end
  end
end
