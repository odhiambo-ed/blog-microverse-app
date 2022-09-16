require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:all) do
    @user = User.create(Name: 'Janet', Photo: 'https://unsplash.com/photos/2LowviVHZ-E', Bio: 'I am twenty years old', PostsCounter: 0)
    @post = Post.new(user_id: @user, Title: 'Hello World', Text: 'This is my first post', CommentsCounter: 0, LikesCounter: 0)
  end

  it 'title must not be blank' do
    @post.title = ' '
    expect(@post).to_not be_valid
  end
end
