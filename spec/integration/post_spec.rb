require 'rails_helper'

RSpec.describe 'Posts index page', type: :feature do
  before :each do
    @user = User.create(name: 'Swine', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'I am an Engineer and am twenty seven years old.', posts_counter: 0)
    @first_post = Post.create(title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter: 0, author_id: @user.id)
    5.times do |i|
      Comment.create(text: 'Great Job!!', author_id: @user.id, post_id: @first_post.id)
    end
    visit user_post_path(@first_post.author, @first_post)
  end

  scenario 'displays number of posts' do
    expect(page).to have_content('This is my first post')
  end

  scenario 'display the post title' do
    expect(page).to have_content(@first_post.title)
  end

  scenario 'display the post body' do
    expect(page).to have_content(@first_post.text)
  end

  scenario 'display the first comment on a post' do
    expect(page).to have_content('Hello')
  end

  scenario 'display the how many comments' do
    expect(page).to have_content('Comments: 0')
  end

  scenario 'display the how many Likes' do
    expect(page).to have_content('Likes: 0')
  end
end

RSpec.describe 'Test the Post show page', type: :feature do
  before :each do
    @user = User.create(name: 'Swine', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'I am an Engineer and am twenty seven years old.', posts_counter: 0)
    @first_post = Post.create(title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter: 0, author_id: @user.id)
    5.times do |i|
      Comment.create(text: 'Great Job!!', author_id: @user.id, post_id: @first_post.id)
    end
    visit user_post_path(@first_post.author, @first_post)
  end

  scenario "I can see the post's title" do
    expect(page).to have_content(@first_post.title)
  end

  scenario 'I can see how many commentsscenario has' do
    expect(page).to have_content('Comments: 0')
  end

  scenario 'I can see how many likesscenario has' do
    expect(page).to have_content('Likes: 0')
  end

  scenario 'I can see the post body' do
    expect(page).to have_content(@first_post.text)
  end

  scenario 'I can see the comment each commentor left' do
    expect(page).to have_content('Hello')
  end
end