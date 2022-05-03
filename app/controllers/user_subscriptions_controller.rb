class UserSubscriptionsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @user_subscriptions = @user.user_subscriptions.all
  end

  def edit
    @user = User.find(params[:user_id])
    @user_subscription = UserSubscription.find(params[:id])
  end

  def update
    user_subscription = UserSubscription.find(params[:id])
    service = EditSubscriptionService.new(user_subscription, params).edit_subscription
    redirect_to users_path
  end
end
