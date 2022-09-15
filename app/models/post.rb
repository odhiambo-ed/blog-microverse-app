class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments

  def update_posts_counter
    user_id.update(posts_counter: author.posts.count)
  end

  def last_comments
    comments.includes(:post_id).order(created_at: :ASC).limit(5)
  end
end
