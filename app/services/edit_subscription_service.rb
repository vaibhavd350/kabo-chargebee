class EditSubscriptionService
  include ActiveModel::Model

  attr_reader :user_subscription
  attr_accessor :params, :subscription, :user

  def initialize(user_subscription, params)
    @params = params
    @user = User.find(params[:user_id])
    @subscription = user_subscription
  end


  def edit_subscription
    subscription_id = subscription.subscription_id
    date = date_format(params[:user_subscription])
    new_subscription = chargebee_subscription_api(subscription_id, date)
    subscription.destroy
    create_user_subscription(new_subscription)
    
  end

  def create_user_subscription(new_subscription)
    # Adding user subscriptions
    if user.present?
      user_subs = user.user_subscriptions.create(subscription_id: new_subscription.id, 
                                                         billing_period: new_subscription.billing_period, 
                                                         billing_period_unit: new_subscription.billing_period_unit, 
                                                         status: new_subscription.status, 
                                                         current_term_start: time_format(new_subscription.current_term_start), 
                                                         current_term_end: time_format(new_subscription.current_term_end), 
                                                         next_billing_at: time_format(new_subscription.next_billing_at), 
                                                         activated_at: time_format(new_subscription.activated_at), 
                                                         currency_code: new_subscription.currency_code, 
                                                         channel: new_subscription.channel)
    

      # Adding Subscription Items
      if user_subs.present?
        create_user_plan_changes_entry(user_subs)
        create_subscription_items(new_subscription, user_subs)
      end
    end
  end

  def create_subscription_items(new_subscription, user_subs)
    subscription_items = new_subscription.subscription_items
    subscription_items.each do |item|
      user_subs.user_subscription_items.create(item_price_id: item.item_price_id, 
                                                       item_type: item.item_type, 
                                                       quantity: item.quantity, 
                                                       unit_price: item.unit_price, 
                                                       amount: item.amount, 
                                                       free_quantity: item.free_quantity, 
                                                       object: item.object)
    end  
  end

  def create_user_plan_changes_entry(user_subs)
    UserPlanChange.create(user_id: user.id, user_subscription_id: user_subs.id, plan_change_date: Time.now)
  end

  def chargebee_subscription_api(subscription_id, date)
    result = ChargeBee::Subscription.change_term_end(subscription_id,{ :term_ends_at => date })
    result.subscription
  end

  def time_format time
    time.nil? ? "" : Time.at(time)
  end

  def date_format(new_date)
    event = new_date
    date = Date.new event["current_term_start(1i)"].to_i, event["current_term_start(2i)"].to_i, event["current_term_start(3i)"].to_i
    date.to_time.to_i
  end

end