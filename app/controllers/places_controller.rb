class PlacesController < ApplicationController
	def new
		@place = Place.new
	end

	def create
		@place = Place.new(params.require(:place).permit(:name, :address, :photo, :notes))
		if @place.save
			redirect_to users_path
		else
			render :new
		end
	end
end
