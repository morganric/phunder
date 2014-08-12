class Campaign < ActiveRecord::Base

	mount_uploader :image, ImageUploader

	mount_uploader :banner, ImageUploader

	belongs_to :user
	has_many :photos

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_campaign
      @photo = Photo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:title, :image, :user_id, :campaign_id, :paid)
    end


end
