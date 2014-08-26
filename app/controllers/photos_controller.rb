class PhotosController < ApplicationController
	def index
		@photos = Photo.all
	end

	def show
		@photo = Photo.find(params[:id])
		@photo.views += 1
		@photo.save
	end

	def new
	end

	def create
		  # Amount in cents
		  @amount = params[:amount].to_i

		  @photo = Photo.new()
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

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:title, :image, :user_id, :campaign_id, :url, :visits, :clicks)
    end
end
