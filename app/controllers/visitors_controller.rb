class VisitorsController < ApplicationController

	def index
		@last_post = Post.last
	end
end
