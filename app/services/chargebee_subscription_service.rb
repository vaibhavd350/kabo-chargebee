class ChargebeeSubscriptionService
  include ActiveModel::Model

  attr_reader :entry
  attr_accessor :customer, :subscription 

  def initialize(entry)
    @subscription = entry.subscription
    @customer = entry.customer
  end


  def add_user_data
    email = customer.email.downcase
    user = User.find_by(email: email)
    if user.nil?
      user = User.new(email: email, 
                      first_name: customer.first_name, 
                      last_name: customer.last_name, 
                      phone: customer.phone, 
                      company: customer.company, 
                      taxability: customer.taxability, 
                      customer_id: customer.id)
      user.skip_password_validation = true
      user.save
    end
    create_user_subscription(user)
  end

  def create_user_subscription user
    # Adding user subscriptions
    if user.present?
      user_subscription = user.user_subscriptions.create(subscription_id: subscription.id, 
                                                         billing_period: subscription.billing_period, 
                                                         billing_period_unit: subscription.billing_period_unit, 
                                                         status: subscription.status, 
                                                         current_term_start: time_format(subscription.current_term_start), 
                                                         current_term_end: time_format(subscription.current_term_end), 
                                                         next_billing_at: time_format(subscription.next_billing_at), 
                                                         activated_at: time_format(subscription.activated_at), 
                                                         currency_code: subscription.currency_code, 
                                                         channel: subscription.channel)
    

      # Adding Subscription Items
      if user_subscription.present?
        create_subscription_items(user_subscription, subscription)
      end
    end
  end

  def create_subscription_items(user_subscription, subscription)
    subscription_items = subscription.subscription_items
    subscription_items.each do |item|
      user_subscription.user_subscription_items.create(item_price_id: item.item_price_id, 
                                                       item_type: item.item_type, 
                                                       quantity: item.quantity, 
                                                       unit_price: item.unit_price, 
                                                       amount: item.amount, 
                                                       free_quantity: item.free_quantity, 
                                                       object: item.object)
    end  
  end

  def time_format time
    time.nil? ? "" : Time.at(time)
  end

end