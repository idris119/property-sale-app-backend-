# app/controllers/payments_controller.rb
class PaymentsController < ApplicationController
  def create_payment
    property_id = params[:propertyId]
    amount = params[:amount]
    payment_method = params[:paymentMethod]
    customer_name = params[:customerName]
    customer_id = params[:customerId]
    contact_number = params[:contactNumber]
    email = params[:email]
    location = params[:location]

    # Save payment information to the database or perform necessary actions
    # You can customize this part based on your application's needs
    payment = Payment.create(
      property_id: property_id,
      amount: amount,
      payment_method: payment_method,
      customer_name: customer_name,
      customer_id: customer_id,
      contact_number: contact_number,
      email: email,
      location: location
    )

    if payment.valid?
      render json: { success: "Payment successful", payment: payment }, status: :created
    else
      render json: { error: payment.errors.full_messages.join(', ') }, status: :unprocessable_entity
    end
  rescue StandardError => e
    render json: { error: "Error making payment: #{e.message}" }, status: :unprocessable_entity
  end
end
