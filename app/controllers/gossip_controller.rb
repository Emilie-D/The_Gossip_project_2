class GossipController < ApplicationController 
  before_action :user_is_logged_in, except: [:index]

	
	def index
		@gossip = Gossip.all
	end 

	def new
		@gossip = Gossip.new	
	end

	def create
	@gossip = Gossip.new(title: params[:title], content: params[:content], user_id: session[:user_id])
    if @gossip.save
      redirect_to "/"
    else
      render "new"
	end 

	end

	def show
		@gossip = Gossip.find(params[:id])
		@user = User.find_by(id: @gossip.user_id)
	end

	def edit
		@gossip = Gossip.find(params[:id])
	end

	def update
		@gossip = Gossip.find(params[:id])
		if @gossip.update(gossip_params)
			redirect_to @gossip
		else
			render :edit
		end
	end

	def destroy
		@gossip = Gossip.find(params[:id])
		@gossip.destroy
		redirect_to "/"
	end

private

  	def gossip_params
    	params.permit(:title, :content)
  	end

end
