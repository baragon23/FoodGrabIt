class UsersController < ApplicationController
	before_action :check_user_logged_in, only: [:edit, :update, :destroy]

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
		@is_login = true
	end

	def create
		@user = User.new(user_params)
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
		if @user.update_attributes(user_params)
			redirect_to users_path
		else
			render 'edit'
		end
	end

	private

    def check_user_logged_in
		if !current_user
			redirect_to root_path
		end
    end

	def user_params
    	params.require(:user).permit(:name, :email, :password)
    end

end







