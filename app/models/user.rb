class User < ApplicationRecord
  has_many :posts, class_name: 'post', foreign_key: :AuthorId
  has_many :likes class_name: 'like', foreign_key: :AuthorId
  has_many :comments class_name: 'comment', foreign_key: :AuthorId

  def last_three_posts
    posts.includes(:user_id).order(created_at: :DESC).limit(3)
  end
end
