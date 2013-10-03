class Comment < ActiveRecord::Base
  validates_presence_of :body
  validates_presence_of :commentable_id
  validates_presence_of :user_id
  belongs_to :user
  has_many :comments, as: :commentable
  belongs_to :commentable, polymorphic: true

   def post
    if self.commentable_type == "Post"
      self.commentable
    else
      self.commentable.post
    end
  end
end
