class AddColumnUpdateToNuke < ActiveRecord::Migration[5.1]
  def change
    add_column :nukes, :update_codes, :string
  end
end
