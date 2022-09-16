class User < ApplicationRecord
  has_many :posts, class_name: 'post', foreign_key: :AuthorId
  has_many :likes
  has_many :comments

  validates :Name, presence: true, allow_blank: false
  validates :PostsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def last_three_posts
    posts.includes(:AuthorId).order(created_at: :DESC).limit(3)
  end
end
