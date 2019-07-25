class Blogger < ApplicationRecord
	has_many :posts
	has_many :destinations, through: :posts

	validates :name, uniqueness: true
	validates :bio, length: { minimum: 30 }
	validates :age, numericality: { greater_than: 0 }


	def popular_post
		self.posts.max{|a,b| a.likes<=>b.likes}  if self.posts.count > 0
	end

	def total_likes
		self.posts.sum {|p| p.likes}
	end

end
