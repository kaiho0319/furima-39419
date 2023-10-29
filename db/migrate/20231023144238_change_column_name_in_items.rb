class ChangeColumnNameInItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :addresses, :orders_id, :order_id
  end
end
