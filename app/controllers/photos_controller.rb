class PhotosController < ApplicationController
	def index
		@photos = Photo.all
	end

	def show
		@photo = Photo.find(params[:id])
	end

	def new
	end

	def create
		  # Amount in cents
		  @amount = params[:amount].to_i

		  @photo = Photo.new()
		  if current_user
			  @photo.user_id = current_user.id
		  end
		  @photo.title = params[:title]
		  @photo.image = params[:image]
		  @photo.campaign_id = params[:campaign_id].to_i
		  @photo.paid = @amount
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

		 redirect_to photo_path(@photo)
end

end
