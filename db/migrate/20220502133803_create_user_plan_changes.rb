class CreateUserPlanChanges < ActiveRecord::Migration[7.0]
  def change
    create_table :user_plan_changes do |t|
      t.integer :user_id
      t.integer :user_subscription_id
      t.datetime :plan_change_date

      t.timestamps
    end
  end
end
