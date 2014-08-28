class PhotosController < ApplicationController
	before_filter :authenticate_user!, except: [:show, :index]	


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

	def edit
		@photo = Photo.find(params[:id])
		authorize @photo
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
		  @photo.url = params[:url]
		  @photo.campaign_id = params[:campaign_id].to_i
		  @photo.paid = @amount
		  @photo.save

		  @donation = Donation.new()
		  @donation.amount = @amount
		  @donation.stripe_email = params[:stripeEmail]
		  @donation.photo_id = @photo.id
		  @donation.user_id = current_user.id
		  @donation.campaign_id = params[:campaign_id].to_i
		  @donation.save

		  customer = Stripe::Customer.create(
		    :email => params[:stripeEmail],
		    :card  => params[:stripeToken]
		  )

		  charge = Stripe::Charge.create(
		    :customer    => customer.id,
		    :amount      => @amount * 100,
		    :description => 'Phunder App',
		    :currency    => 'usd'
		  )

		rescue Stripe::CardError => e
		  flash[:error] = e.message
		  redirect_to charges_path

		 redirect_to photo_path(@photo)
	end


	def update
		@photo = Photo.find(params[:id])
    
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @photo }
      else
        format.html { render :edit }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end


	private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:title, :image, :user_id, :campaign_id, :url, :visits, :clicks, :paid, :hidden)
    end
end
