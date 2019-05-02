class UserController < ApplicationController
	def welcome
		 @user = User.find(params[:id])
	end

	def show
		@user = User.all
		@user = User.find(params[:id])
	end 

	def new
	end

	def create
		@user = User.new(
			first_name: params[:first_name],
			last_name: params[:last_name],
			description: params[:description],
			email: params[:email],
			age: params[:age],
			city_id: City.all.sample.id,
			password: params[:password],
			password_confirmation: params[:password_confirmation])
		if @user.save
			session[:user_id] = user.id
			flash[:success] = 'Successfully create user !'
			redirect_to "/"
		else
			flash[:warning] = 'Invalid email or password'
			redirect_to "/signup"
		end 

	end

end
