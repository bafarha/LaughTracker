class Tag < ActiveRecord::Base

	has_many :subjects
	has_many :jokes, through: :subjects

	accepts_nested_attributes_for :subjects,
		:reject_if => :all_blank,
		:allow_destroy => :true
	accepts_nested_attributes_for :jokes
end
