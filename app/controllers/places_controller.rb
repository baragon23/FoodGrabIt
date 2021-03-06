class PlacesController < ApplicationController
	def index
		if !current_user 
			redirect_to root_path
		else
			@places = current_user.places.all
		end
	end

	def new
		@place = Place.new
	end

	def show
		@place = Place.find(params[:id])
	end

	def create
		@place = current_user.places.new(places_params)
		if @place.save
			redirect_to places_path
		else
			render :new
		end
	end

	def edit
		@place = Place.find(params[:id])
	end

	def update
		@place = Place.find(params[:id])
		if @place.update_attributes(places_params)
			redirect_to places_path
		else
			render 'edit'
		end
	end

	def destroy
		@place = Place.find(params[:id])
		@place.destroy
	    redirect_to places_path
	end

private
	def places_params
		params.require(:place).permit(:name, :address, :photo, :notes)
	end
end
