class CheckoutController < ApplicationController

def create
	
	operation = Operation.find(params[:id])
	session = Stripe::Checkout::Session.create({
		payment_method_types: ['card'],
		line_items: [{
			description: operation.id,
			name: "Morticia",
			amount: 199,
			currency: 'eur',
			quantity: 1,
		}],
		
		client_reference_id: operation.id,
		mode: 'payment',
		success_url: root_url,
		cancel_url: your_operations_url,
	})
	
	redirect_to session.url, allow_other_host: true

end
  
end
  