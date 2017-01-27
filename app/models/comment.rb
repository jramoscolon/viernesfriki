class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :episode

  validates :body, presence: true
  validates :user, presence: true
  validates :episode, presence: true
  validates :rating, numericality: { only_integer: true }

end
