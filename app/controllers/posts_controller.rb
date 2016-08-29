class PostsController < ApplicationController

	def new
		if user_signed_in? 
		    @post = Post.new
		else
			flash[:alert] = "You must be signed in to post!"
			redirect_to :root
		end
	end

	def create
		@post = current_user.posts.create(post_params)
		if @post.save
			redirect_to :root
		else
			flash[:alert] = "Failed to Create"
			redirect_to :back
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to :root
	end

	private

	def post_params
		params.require(:post).permit(:content)
	end
end
