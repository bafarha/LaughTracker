class Note < ActiveRecord::Base
  belongs_to :user
  belongs_to :joke

  validates :body, presence: true
  validates :user, presence: true
  validates :joke, presence: true
  #validates :rating, numerically: { only_integer: true }
end
