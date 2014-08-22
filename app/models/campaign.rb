class Campaign < ActiveRecord::Base

	mount_uploader :image, ImageUploader

	mount_uploader :banner, ImageUploader

	belongs_to :user
	has_many :photos

  def percent
      running = 0
      self.photos.each do |photo| 
        running = running + photo.paid
      end

    return  ((running.to_f / self.target.to_f) * 100).round(2)
  end

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
