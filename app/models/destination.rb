class Destination < ApplicationRecord
	has_many  :posts
	has_many :bloggers, through: :posts

	def bloggers_average_age
		self.bloggers.sum{|b| b[:age]}/self.bloggers.count
	end
	def recent_posts
		self.posts.last(5)
	end
	def popular_post
		self.posts.max {|a, b| a.likes <=> b.likes}
	end
end
