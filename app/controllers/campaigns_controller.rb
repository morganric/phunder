class CampaignsController < ApplicationController
  before_filter :authenticate_user!, except: [:show, :index, :tag]
  before_action :set_campaign, only: [:show, :edit, :update, :destroy]
  require 'rails_autolink'


  # GET /campaigns
  # GET /campaigns.json
  def index
    @campaigns = Campaign.all
  end

  # GET /campaigns/1
  # GET /campaigns/1.json
  def show

      Rails.configuration.stripe = {
      :publishable_key => @campaign.user.stripe_publishable_key || ENV['PUBLISHABLE_KEY'] ,
      :secret_key      => @campaign.user.stripe_secret_key || ENV['SECRET_KEY']
      }

      Stripe.api_key = Rails.configuration.stripe[:secret_key]
      # Stripe.api_key = @campaign.user.stripe_secret_key

      @photos = @campaign.photos.where(:hidden => false).order('views DESC')

      @photos = Kaminari.paginate_array(@photos).page(params[:page]).per(9)

  end

  def tag
    @campaigns = Campaign.tagged_with(params[:id]).page(params[:all])

    @tags = Campaign.tag_counts_on(:tags)
    render :action => 'index'
  end

  # GET /campaigns/new
  def new
    @campaign = Campaign.new
  end

  # GET /campaigns/1/edit
  def edit
    authorize @campaign
  end

  # POST /campaigns
  # POST /campaigns.json
  def create
    @campaign = Campaign.new(campaign_params)
    @campaign.user_id = current_user.id

    respond_to do |format|
      if @campaign.save
        format.html { redirect_to @campaign, notice: 'Campaign was successfully created.' }
        format.json { render :show, status: :created, location: @campaign }
      else
        format.html { render :new }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /campaigns/1
  # PATCH/PUT /campaigns/1.json
  def update
    respond_to do |format|
      if @campaign.update(campaign_params)
        format.html { redirect_to @campaign, notice: 'Campaign was successfully updated.' }
        format.json { render :show, status: :ok, location: @campaign }
      else
        format.html { render :edit }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campaigns/1
  # DELETE /campaigns/1.json
  def destroy
    @campaign.destroy
    respond_to do |format|
      format.html { redirect_to campaigns_url, notice: 'Campaign was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campaign
      @campaign = Campaign.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def campaign_params
      params.require(:campaign).permit(:name, :description, :user_id, :target,
       :live, :price, :image, :banner, :end_date, :hashtag, :water_mark, :tag_list)
    end
end
