class Joke < ActiveRecord::Base

	has_many :subjects
	has_many :tags, through: :subjects
end
