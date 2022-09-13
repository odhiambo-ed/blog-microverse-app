class User < ApplicationRecord
    has_many :posts, foreign_key: :AuthorId
    has_many :comments, foreign_key: :AuthorId
    has_many :likes, foreign_key: :AuthorId
end
