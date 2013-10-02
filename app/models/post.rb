class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :url, presence: true
  has_many :votes
  belongs_to :user
end
