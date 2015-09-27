class Joke < ActiveRecord::Base
	acts_as_taggable
	belongs_to :user
	has_many :notes

	def average_rating
  		notes.average(:rating).to_f
	end
end
