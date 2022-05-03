class UserSubscription < ApplicationRecord
	has_many :user_subscription_items
	belongs_to :user
end
