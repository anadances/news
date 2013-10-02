class Comment < ActiveRecord::Base
  validates_presence_of :body
  validates_presence_of :post_id
  validates_presence_of :user_id
  belongs_to :user
  belongs_to :post
end
