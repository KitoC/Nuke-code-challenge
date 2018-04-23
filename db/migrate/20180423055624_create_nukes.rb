class CreateNukes < ActiveRecord::Migration[5.1]
  def change
    create_table :nukes do |t|
      t.string :nuke_code

      t.timestamps
    end
  end
end
