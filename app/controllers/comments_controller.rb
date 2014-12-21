class CommentsController < ApplicationController

	def new
		if !current_user.nil?
			@post = Post.find(params[:post_id])
			@comment = Comment.new
		else
			flash[:alert] = "You must be signed in to post comments"
			redirect_to posts_path
		end
	end

	def create
		@post = Post.find(params[:post_id])
		@post.comments.create(comments_params)
		redirect_to posts_path
	end

	def comments_params
		params.require(:comment).permit(:comments)
	end

end