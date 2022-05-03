class HomeController < ApplicationController
  require 'chargebee'

  def index
  end

  def chargebee_data
    list = ChargeBee::Subscription.list
    list.each do |entry|
      service = ChargebeeSubscriptionService.new(entry).add_user_data
    end
    redirect_to root_path
  end
end
