class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string    :product_name,               null: false
      t.text      :product_description,        null: false
      # t.integer   :category_information_id,    null: false
      t.integer   :category_information_id_id,    null: false
      # t.integer   :item_condition_id,          null: false
      t.integer   :product_condition_id,          null: false
      # t.integer   :shipping_responsibility_id, null: false
      t.integer   :delivery_charge_id, null: false
      # t.integer   :processing_time_id,         null: false
      t.integer   :shipping_days_id,         null: false
      t.integer   :price,                      null: false
      # t.integer   :shipping_origin_id,         null: false
      t.integer   :region_of_origin_id,         null: false
      t.references  :user,                     null: false, foreign_key: true
      t.timestamps
    end
  end
end
