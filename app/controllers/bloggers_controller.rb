class BloggersController < ApplicationController

	def index
		@bloggers = Blogger.all

	end

	def new
		@blogger = Blogger.new
	end

	def create

		@blogger = Blogger.new(b_params)
		if @blogger.valid?
			@blogger.save
			redirect_to blogger_path(@blogger)
		else
      		flash[:errors]= @blogger.errors.full_messages
      		redirect_to new_blogger_path
    	end

		
	end

	def show

		@blogger = Blogger.find(params[:id])
		@posts = @blogger.posts

		@popular_post  = @blogger.popular_post
		@total_likes = @blogger.total_likes
	end

	def b_params
		params.require(:blogger).permit(:name, :bio, :age)
	end
end
