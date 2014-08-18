class UsersController < ApplicationController
	def index
		if current_user 
			redirect_to places_path
		end
		@users = User.all
		@places = Place.all
	end

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(params.require(:user).permit(:name, :email, :password))
		if @user.save
			redirect_to root_path
		else
			render :new
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(params.require(:user).permit(:name, :email, :password))
			redirect_to users_path
		else
			render 'edit'
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to users_path
	end
end
