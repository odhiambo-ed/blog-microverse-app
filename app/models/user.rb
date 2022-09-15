class User < ApplicationRecord
  has_many :posts, class_name: 'post', foreign_key: :AuthorId
  has_many :likes
  has_many :comments

  def last_three_posts
    posts.includes(:user_id).order(created_at: :DESC).limit(3)
  end
end
