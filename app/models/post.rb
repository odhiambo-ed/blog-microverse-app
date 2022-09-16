class Post < ApplicationRecord
  belongs_to :author, class_name: 'user'
  has_many :likes, class_name: 'like', foreign_key: :post_id
  has_many :comments, class_name: 'comment', foreign_key: :post_id

  validates :Title, presence: true, allow_blank: false, length: { maximum: 250 }
  validates :CommentsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :LikesCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def update_posts_counter
    user_id.update(PostsCounter: author.posts.count)
  end

  def last_comments
    comments.includes(:post_id).order(created_at: :ASC).limit(5)
  end
end
