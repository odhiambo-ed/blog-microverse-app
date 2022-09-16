class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :AuthorId
  belongs_to :post, class_name: 'post'

  def update_comments_counter
    post.update(CommentsCounter: post.comments.count)
  end
end
