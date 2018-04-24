class AddColumnToNuke < ActiveRecord::Migration[5.1]
  def change
    add_column :nukes, :president, :string
    add_column :nukes, :secretary, :string
  end
end
