class PostsController < ApplicationController
	def index
		@posts = Post.all

	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.likes = 0
		
		if @post.valid?
			@post.save
			redirect_to post_path(@post)
		else
      		flash[:errors]= @post.errors.full_messages
      		redirect_to new_post_path
    	end
	end

	def edit
		@post = Post.find(params[:id])
	end


	def update
		@post = Post.find(params[:id])
		#byebug
		if params[:commit] == "Like it!"
			@post.likes += 1
			@post.save
			redirect_to post_path(@post)
		else

			@post.update(post_params)
			redirect_to post_path(@post)

		end

	end

	def show
		@post = Post.find(params[:id])
		@blogger = @post.blogger
	end

	def post_params
		params.require(:post).permit(:title, :content, :blogger_id, :destination_id)
	end
end
