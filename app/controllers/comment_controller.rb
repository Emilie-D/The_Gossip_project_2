class CommentController < ApplicationController
	def show
		@comment = Comment.all
	end

	def new 
		@comment = Comment.new
	end 

	def create 
		@gossip = Gossip.find(params['gossip_id'])
    	@comment = Comment.new(content: params[:content], author: User.find_by(first_name: "Anonymous"), gossip: @gossip)
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
		if @comment.update(content: params[:content], author: @comment.author, gossip: @comment.gossip)
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
    	params.require(:comment).permit(:author, :content)
  	end

end

