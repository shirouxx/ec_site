class ChargesController < ApplicationController
  def new
  end

  def create
    Stripe.api_key = 'sk_test_ZsDWQqBTJyTtCchqAC0R1I7W'
    sum = 0
    @cart = session[:cart].map { |item_id| Item.find(item_id) }
    @cart.each do |item|
      sum += item.price
    end
    amount = sum

    customer = Stripe::Customer.create(
     email: params[:stripeEmail],
     source: params[:stripeToken]
     )
   Stripe::Charge.create(
     customer: customer.id,
     amount: amount,
     currency: 'jpy'
     )
     session[:cart] = []
  end

end
