class Post < ApplicationRecord
  belongs_to :author, class_name: 'user', foreign_key: :AuthorId
  has_many :likes,  class_name: 'like', foreign_key: :post_id
  has_many :comments, class_name: 'comment', foreign_key: :post_id

  def update_posts_counter
    user_id.update(posts_counter: author.posts.count)
  end

  def last_comments
    comments.includes(:post_id).order(created_at: :ASC).limit(5)
  end
end
