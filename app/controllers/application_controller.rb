class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?


	#ChargeBee::Customer.list ( get customer data )
	#ChargeBee::Subscription.list({:limit=> 2}) ( get subscription data )
	#ChargeBee::ItemPrice.list ( get all plan data )

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone, :company, :taxability, :customer_id])
  end

end



# User has_many subscriptions

# Plan(Item)  

# 

# #<ChargeBee::Customer:0x29770 > JSON: {                                          
#   "id": "cbdemo_richard",                                                        
#   "first_name": "Richard",                                                       
#   "last_name": "Hendricks",                                                      
#   "email": "richard_AT_test.com@example.com",                                    
#   "phone": "1155685961",                                                         
#   "company": "Zencorporation",                                                   
#   "auto_collection": "on",                                                       
#   "net_term_days": 0,                                                            
#   "allow_direct_debit": false,                                                   
#   "created_at": 1651221901,                                                      
#   "taxability": "taxable",                                                       
#   "updated_at": 1651231741,                                                      
#   "pii_cleared": "active",                                                       
#   "channel": "web",
#   "resource_version": 1651231741436,
#   "deleted": false,
#   "object": "customer",
#   "card_status": "valid",
#   "promotional_credits": 0,
#   "refundable_credits": 0,
#   "excess_payments": 0,
#   "unbilled_charges": 0,
#   "preferred_currency_code": "USD",
#   "primary_payment_source_id": "pm_169lMcT4NipA71NFJ",
#   "payment_method": {
#     "object": "payment_method",
#     "type": "card",
#     "reference_id": "tok_169lMcT4Nip9y1NFI",
#     "gateway": "chargebee",
#     "gateway_account_id": "gw_16CGdzT4NikhN2aB",
#     "status": "valid"
#   }
# } 


# #<ChargeBee::Subscription:0x29838 > JSON: {
#   "id": "AzZlBDT4OO6mt2yP",
#   "billing_period": 1,
#   "billing_period_unit": "month",
#   "customer_id": "cbdemo_richard",
#   "status": "active",
#   "current_term_start": 1651231741,
#   "current_term_end": 1653823741,
#   "next_billing_at": 1653823741,
#   "created_at": 1651231741,
#   "started_at": 1651231741,
#   "activated_at": 1651231741,
#   "updated_at": 1651236094,
#   "has_scheduled_changes": false,
#   "channel": "web",
#   "resource_version": 1651236094581,
#   "deleted": false,
#   "object": "subscription",
#   "currency_code": "USD",
#   "subscription_items": [
#     {
#       "item_price_id": "cbdemo_advanced-USD-monthly",
#       "item_type": "plan",
#       "quantity": 4,
#       "unit_price": 1000,
#       "amount": 1000,
#       "free_quantity": 3,
#       "object": "subscription_item"
#     }
#   ],
#   "due_invoices_count": 0,
#   "mrr": 60000,
#   "exchange_rate": 1.0,
#   "base_currency_code": "USD"
# } 


# #<ChargeBee::Card:0x2984c > JSON: {                 
#   "status": "valid",                                
#   "gateway": "chargebee",                           
#   "gateway_account_id": "gw_16CGdzT4NikhN2aB",      
#   "first_name": "Ritchie",                          
#   "last_name": "Fox",                               
#   "iin": "401288",                                  
#   "last4": "1881",                                  
#   "card_type": "visa",                              
#   "funding_type": "not_known",                      
#   "expiry_month": 10,                               
#   "expiry_year": 2026,                              
#   "created_at": 1651221902,                         
#   "updated_at": 1651221902,                         
#   "resource_version": 1651221902098,
#   "object": "card",
#   "masked_number": "************1881",
#   "customer_id": "cbdemo_richard",
#   "payment_source_id": "pm_169lMcT4NipA71NFJ"
# } 


# #<ChargeBee::Invoice:0x29860 > JSON: {              
#   "id": "2",                                        
#   "customer_id": "cbdemo_richard",                  
#   "subscription_id": "AzZlBDT4OO6mt2yP",            
#   "recurring": true,                                
#   "status": "paid",                                 
#   "price_type": "tax_exclusive",                    
#   "date": 1651236094,                               
#   "due_date": 1651236094,                           
#   "net_term_days": 0,                               
#   "exchange_rate": 1.0,                             
#   "total": 998,                                     
#   "amount_paid": 0,                                 
#   "amount_adjusted": 0,                             
#   "write_off_amount": 0,
#   "credits_applied": 998,
#   "amount_due": 0,
#   "paid_at": 1651236094,
#   "updated_at": 1651236094,
#   "resource_version": 1651236094547,
#   "deleted": false,
#   "object": "invoice",
#   "first_invoice": false,
#   "amount_to_collect": 0,
#   "round_off_amount": 0,
#   "has_advance_charges": false,
#   "currency_code": "USD",
#   "base_currency_code": "USD",
#   "generated_at": 1651236094,
#   "is_gifted": false,
#   "term_finalized": true,
#   "channel": "web",
#   "tax": 0,
#   "line_items": [
#     {
#       "id": "li_AzqMIrT4OgNDfmoc",
#       "date_from": 1651236094,
#       "date_to": 1653823741,
#       "unit_amount": 998,
#       "quantity": 1,
#       "amount": 998,
#       "pricing_model": "per_unit",
#       "is_taxed": false,
#       "tax_amount": 0,
#       "object": "line_item",
#       "subscription_id": "AzZlBDT4OO6mt2yP",
#       "customer_id": "cbdemo_richard",
#       "description": "Advanced - Monthly Plan - Prorated Charges",
#       "entity_type": "plan_item_price",
#       "entity_id": "cbdemo_advanced-USD-monthly",
#       "entity_description": "Advanced Monthly Plan USD",
#       "tax_exempt_reason": "tax_not_configured",
#       "discount_amount": 0,
#       "item_level_discount_amount": 0
#     }
#   ],
#   "sub_total": 998,
#   "linked_payments": [

#   ],
#   "applied_credits": [
#     {
#       "applied_amount": 998,
#       "applied_at": 1651236094,
#       "cn_id": "TEST-CN-3",
#       "cn_reason_code": "subscription_change",
#       "cn_create_reason_code": "Subscription Change",
#       "cn_date": 1651236094,
#       "cn_status": "refund_due"
#     }
#   ],
#   "adjustment_credit_notes": [

#   ],
#   "issued_credit_notes": [

#   ],
#   "linked_orders": [

#   ],
#   "dunning_attempts": [

#   ],
#   "billing_address": {
#     "first_name": "Richard",
#     "last_name": "Hendricks",
#     "company": "Zencorporation",
#     "validation_status": "not_validated",
#     "object": "billing_address"
#   }
# }