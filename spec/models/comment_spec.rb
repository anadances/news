require 'spec_helper'

describe Comment do
  it { should belong_to :user }
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :commentable_id }
  it { should have_many :comments }

  describe "post" do
    it "should find the post that originated the comment" do
      post = Post.create(:title => "hello", :url => "hello")
      comment = post.comments.create(:user_id => 1, :body => "hello")
      comment2 = comment.comments.create(:user_id => 1, :body => "hello")
      comment2.post.should eq post
    end
  end
end
