# app/controllers/payments_controller.rb
class PaymentsController < ApplicationController
    # ...
  
    def callback
      # Retrieve the payment reference and status from the callback params
      reference = params[:pesapal_merchant_reference]
      status = params[:pesapal_notification_type]
  
      # Update the payment status in your database based on the callback response
      payment = Payment.find_by(reference: reference)
      payment.update(status: status) if payment
  
      # Respond to Pesapal with a simple success message
      render plain: 'pesapal_notification_type=CHANGE'
    end
  end
  