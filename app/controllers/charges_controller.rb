class ChargesController < ApplicationController

	def new
end

def create
  # Amount in cents
  @amount = params[:amount].to_i

  @photo = Photo.new()
  @photo.title = params[:title]
  @photo.image= params[:image]
  @photo.campaign_id = params[:campaign_id].to_i
  @photo.save

  customer = Stripe::Customer.create(
    :email => 'example@stripe.com',
    :card  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount * 100,
    :description => 'Rails Stripe customer',
    :currency    => 'usd'
  )

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to charges_path
end


end
