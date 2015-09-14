class Subject < ActiveRecord::Base

	belongs_to :joke
	belongs_to :tag

	accepts_nested_attributes_for :joke, :reject_if => :all_blank
end
