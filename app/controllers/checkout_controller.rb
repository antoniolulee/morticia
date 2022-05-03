class CheckoutController < ApplicationController

def create
	
	session = Stripe::Checkout::Session.create({
		payment_method_types: ['card'],
		line_items: [{
			name: 'Morticia',
			amount: 199,
			currency: 'eur',
			quantity: 1,
		}],
		mode: 'payment',
		success_url: root_url,
		cancel_url: your_operations_url,
	})
	
	redirect_to session.url, allow_other_host: true

end
  
end
  