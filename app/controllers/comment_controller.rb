class CommentController < ApplicationController
	def show
		@comment = Comment.all
	end

	def new 
		@comment = Comment.new
	end 

	def create 
		@gossip = Gossip.find(params['gossip_id'])
		@comment = Comment.create!(content: params[:content], gossip: @gossip,user_id: session[:user_id])
    	if @comment.save
      	redirect_to gossip_path(@gossip.id)
    	else
      	redirect_to gossip_path(@gossip.id)
    	end
	end 

	def edit
		@comment = Comment.find(params[:id])
	end

	def update
		@comment = Comment.find(params[:id])
    	if @comment.update(content: params[:content])
			redirect_to '/'
		else
			render :edit
		end
	end

	def destroy
		@comment = Comment.find(params[:id])
		gossip = @comment.gossip
		@comment.destroy
		redirect_to gossip_path(gossip.id)
	end

	private

  	def comment_params
    	params.require(:comment).permit(:content)
  	end

end

