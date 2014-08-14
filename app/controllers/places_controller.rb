class PlacesController < ApplicationController
	def new
		@place = Place.new
	end

	def show

	end

	def create
		@place = current_user.places.new(params.require(:place).permit(:name, :address, :photo, :notes))
		if @place.save
			redirect_to home_path
		else
			render :new
		end
	end

	def destroy
		@place = Place.find(params[:id])
		@place.destroy
	    # Exactly the same idea as this little number:
		# Place.find_by(id: params[:id])
	    redirect_to home_path
	end
end
