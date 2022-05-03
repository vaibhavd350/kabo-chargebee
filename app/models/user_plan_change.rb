class UserPlanChange < ApplicationRecord
	belongs_to :user
	belongs_to :user_subscription
end
