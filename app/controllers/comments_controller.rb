class CommentsController < ApplicationController

	http_basic_authenticate_with :name => "dhh", :password => "secret", :only => :destroy
	
	def create
		params.permit!
    	@post = Post.find(params[:post_id])
    	@comment = @post.comments.create(params[:comment])
    	redirect_to post_path(@post)
  	end

  	def destroy
  		params.permit!
    	@post = Post.find(params[:post_id])
    	@comment = @post.comments.find(params[:id])
    	@comment.destroy
    	redirect_to post_path(@post)
  	end
end
