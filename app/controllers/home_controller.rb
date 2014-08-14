class HomeController < ApplicationController
	def index
		@places = current_user.places.all
	end
end
