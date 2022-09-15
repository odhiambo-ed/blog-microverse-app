class Like < ApplicationRecord
  belongs_to :author, class_name: 'user', foreign_key: :AuthorId
  belongs_to :post, class_name: 'post'

  def update_likes_counter
    post.update(LikesCounter: post.likes.count)
  end
end
