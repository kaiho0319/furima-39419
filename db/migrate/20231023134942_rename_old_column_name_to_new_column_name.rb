class RenameOldColumnNameToNewColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :orders, :users_id, :user_id
    rename_column :orders, :items_id, :item_id
  end
end
