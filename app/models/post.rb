class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :url, presence: true
  has_many :votes
  belongs_to :user
  has_many :comments, as: :commentable

  def self.sort_by_votes
    all.sort_by { |post| post.calculate_score }.reverse
  end

  def calculate_score
    minutes_since_post = (Time.now - self.created_at.to_time) / 60
    percent_of_day = (200 - minutes_since_post) / 200
    self.votes.count * percent_of_day
  end
end
