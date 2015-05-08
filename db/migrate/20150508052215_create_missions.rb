class CreateMissions < ActiveRecord::Migration
  def change
    create_table :missions do |t|
      t.string :bad_habit
      t.date :target_deadline
      t.float :contribution_goal
      t.string :charity
      t.float :current_balance
      t.float :total_balance
      t.integer :payments_made
      t.boolean :goal_reached
      t.boolean :status
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
