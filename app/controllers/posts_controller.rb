class PostsController < ApplicationController

	def new
		@post = Post.new
	end

	def create
		@post = Post.create(post_params)
		if @post.save
			redirect_to :root
		else
			flash[:alert] = "Failed to Create"
			redirect_to :back
		end
	end

	private

	def post_params
		params.require(:post).permit(:content)
	end
end
