class DestinationsController < ApplicationController
	def index
		@destinations = Destination.all

	end

	def new
	end

	def create
	end

	def show
		@destination = Destination.find(params[:id])
		@posts = @destination.posts
		@recent_posts = @destination.recent_posts #= @posts.last(5)
		@popular_post = @destination.popular_post  #@posts.max {|a, b| a.likes <=> b.likes}
		@average_age = @destination.bloggers_average_age
	end
end
