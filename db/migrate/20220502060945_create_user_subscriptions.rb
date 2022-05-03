class CreateUserSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :user_subscriptions do |t|
      t.string :subscription_id
      t.string :billing_period
      t.string :billing_period_unit
      t.string :status
      t.datetime :current_term_start
      t.datetime :current_term_end
      t.datetime :next_billing_at
      t.datetime :activated_at
      t.string :currency_code
      t.string :channel
      t.integer :user_id
      t.timestamps
    end
  end
end
