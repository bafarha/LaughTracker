class Tag < ActiveRecord::Base
	has_many :subjects
	has_many :jokes, through: :subjects
end
