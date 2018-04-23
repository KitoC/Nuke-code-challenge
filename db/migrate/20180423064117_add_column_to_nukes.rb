class AddColumnToNukes < ActiveRecord::Migration[5.1]
  def change
    add_column :nukes, :nuke_code_first, :string
    add_column :nukes, :nuke_code_last, :string
  end
end
