class AddFieldsToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :AuthorId, :integer
    add_column :posts, :CommentsCounter, :integer
    add_column :posts, :LikesCounter, :integer
  end
end
