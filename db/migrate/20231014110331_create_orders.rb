class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :card_information, null: false
      t.integer :month, null: false
      t.integer :day, null: false
      t.string :security_code, null: false
      t.string :token, null: false
      t.references :address, foreign_key: true
      t.timestamps
    end
  end
end
