class VisitorsController < ApplicationController

	def index
		@posts = Post.order(created_at: :desc).limit(30)
	end
end
