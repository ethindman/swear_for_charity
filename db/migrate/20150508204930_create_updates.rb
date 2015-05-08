class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.float :amount
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end