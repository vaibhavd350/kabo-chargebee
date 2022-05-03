class CreateUserSubscriptionItems < ActiveRecord::Migration[7.0]
  def change
    create_table :user_subscription_items do |t|
      t.string :item_price_id
      t.string :item_type
      t.integer :quantity
      t.string :unit_price
      t.decimal :amount
      t.integer :free_quantity
      t.string :object
      t.integer :user_subscription_id
      t.timestamps
    end
  end
end
