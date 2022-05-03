class UserSubscriptionItemsController < ApplicationController

  def index
    @subscription = UserSubscription.find(params[:user_subscription_id])
    @items = @subscription.user_subscription_items.all
  end
end
