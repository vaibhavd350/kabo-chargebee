# README

## System Dependencies
- Ruby ruby-3.0.0
- Postresql 13.0

## Development Setup
1. Clone this repository
	 - git clone https://github.com/vaibhavd350/kabo-chargebee.git
2. `bundle install`
3. `rails db:create` 
4. `rails db:migrate`
5. `rails server`

### Configuration for getting data from subscription management tool (​ https://www.chargebee.com/​ ) into a system

1. Create a sandbox account on **chargebee**.
2. It will create a test website like https://oaktreecloud-test.chargebee.com/.
3. Create an API key with full access. 

### Configure chargebee setting into the project 

1. create a file under ***config/initializers/chargebee.rb***.
2. Add code such as 
	```ruby
		ChargeBee.configure(:site => "oaktreecloud-test", :api_key => "test_XXXXXXXXXXXXXXXXXXXXXXX")
	```

3. Your project will now will able to get data from your chargebee sandbox account.

### Create models in project
1. Create *User*, *UserSubscription*, *UserSubscriptionItem* and *UserPlanChage* model. 

### Fetch data from chargebee
1. From below command we can fetch all subscriptions from chargebee. 

	```ruby
		list = ChargeBee::Subscription.list
	```
### Upadate subscription for a particular customer on chargebee

1. This command update the subscription plans terms.

	```ruby
		ChargeBee::Subscription.change_term_end(chargebee_subscription_id,{ :term_ends_at => date })
	```

1. It will update the subscription plan on chargebee. 
2. While updating the plan on chargebee, we will create an entry in our database. 
2. We will create an entry in ***user_plan_changes*** table for a particular customer and easily track the record. 
