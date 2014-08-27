class VisitorsController < ApplicationController

	def index
		@campaigns = Campaign.all.page(params[:page])
	end
end
