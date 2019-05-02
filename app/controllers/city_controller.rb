class CityController < ApplicationController

	def new
		@city = City.new
	end

	def show
		@city = City.find(params[:id])
		@gossip = Gossip.all
		@user = User.all
	end
	
end
