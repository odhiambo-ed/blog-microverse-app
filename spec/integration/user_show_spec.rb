require 'rails_helper'

RSpec.describe 'Test Show user Page', type: :feature do
  describe 'GET Show' do
    before(:each) do
      @user = User.create(name: 'Rose', photo: 'image1.png', bio: 'bio1', posts_counter: 0)
      @user.save!
      @first_post = Post.create(author: @user, title: 'My first post', text: 'This is my first post on this site. Can you believe it?',
                                comments_counter: 0, likes_counter: 0, id: 1)
      @second_post = Post.create(author: @user, title: 'My second post', text: 'This is my second post on this site. Can you believe it?',
                                 comments_counter: 0, likes_counter: 0, id: 2)
      @third_post = Post.create(author: @user, title: 'My third post', text: 'This is my third post on this site. Can you believe it?',
                                comments_counter: 0, likes_counter: 0, id: 3)
      @fourth_post = Post.create(author: @user, title: 'My fourth post',
                                 text: 'This is my fourth post on this site. Can you believe it?', comments_counter: 0, likes_counter: 0, id: 4)

      visit(user_path(id: @user.id))
    end

    it 'shows the user username' do
      expect(page).to have_content('Arnold')
    end

    it 'shows the user profile picture' do
      expect(page).to have_css('img[src*="image1.png"]')
    end

    it 'shows the user bio' do
      expect(page).to have_content('This my first life story')
    end

    it 'shows the number of posts the user has written' do
      expect(page).to have_content('10')
    end

    it 'shows all the posts the user has written' do
      expect(page).to have_content('My last post')
      expect(page).to have_content('My third post')
      expect(page).to have_content('My second post')
    end

    it 'should have button to show all posts' do
      expect(page).to have_link('See all posts')
    end
  end
end