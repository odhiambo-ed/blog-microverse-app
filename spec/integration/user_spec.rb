require 'rails_helper'

# Test the users index page using integration tests

RSpec.describe 'Users Index Page', type: :feature do
  before :each do
    @user = User.create(name: 'Swine', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                        bio: 'I am an Engineer and am twenty seven years old.', posts_counter: 0)
    @user2 = User.create(name: 'Janet', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                         bio: 'I am an Engineer and am twenty seven years old.', posts_counter: 0)
  end
  scenario 'displays all users username' do
    visit '/'
    expect(page).to have_content(@user.name)
    expect(page).to have_content(@user2.name)
  end

  scenario 'displays all users profile photo' do
    visit user_path(id: @user.id)
    visit user_path(id: @user2.id)
    find("img[src='https://unsplash.com/photos/F_-0BxGuVvo']")
    find("img[src='https://unsplash.com/photos/F_-0BxGuVvo']")
  end

  scenario 'displays number of posts' do
    visit '/'
    expect(page).to have_content('Number of posts: 0')
  end

  #   scenario 'after clicking on a user, the user profile page is displayed' do
  #     visit '/'
  #     click_on @user1
  #     expect(page).to have_content('User Details')
  #   end
end

RSpec.describe 'Users Show Page', type: :feature do
  before :each do
    @user = User.create(name: 'Swine', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                        bio: 'I am an Engineer and am twenty seven years old.', posts_counter: 0)

    5.times do |i|
      Post.create(author: @user, title: "Post #{i}", text: 'This is my post')
    end
    visit user_path(id: @user.id)
  end

  scenario 'display user name and bio' do
    expect(page).to have_content(@user.name)
    expect(page).to have_content(@user.bio)
  end

  scenario 'displays user profile photo' do
    find("img[src='https://unsplash.com/photos/F_-0BxGuVvo']")
  end

  scenario 'displays static text' do
    expect(page).to have_content('User Details')
  end

  it 'Shows the User name' do
    expect(page).to have_content @user1
  end

  it 'shows number of user posts ' do
    expect(page).to have_content('Number of posts: 0')
  end

  it 'shows number of user bio' do
    expect(page).to have_content('I am an Engineer and am twenty seven years old')
  end
end
