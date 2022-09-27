require 'rails_helper'

# Test the users index page using integration tests

RSpec.describe 'Users Index Page', type: :feature do
  before :each do
    @user = User.create(name: 'Swine', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.', posts_counter: 0)
    @user2 = User.create(name: 'Janet', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.', posts_counter: 0)
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

  scenario 'after clicking on a user, the user profile page is displayed' do
    visit '/'
    click_link @user.name
    expect(page).to have_content(@user.name)
    expect(page).to have_content(@user.bio)
  end
end

RSpec.describe 'Users Show Page', type: :feature do
  before :each do
    @user = User.create(name: 'Swine', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.', posts_counter: 0)

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

  scenario 'displays user number of post' do
    expect(page).to have_content("Number of posts: #{@user.posts_counter}")
  end
  scenario 'displays user first 3 posts' do
    expect(page).to have_content('Post 4')
    expect(page).to have_content('Post 3')
    expect(page).to have_content('Post 2')
    expect(page).to_not have_content('Post 1')
  end

  scenario 'button to view all posts is visible' do
    find_button('See all posts')
  end

  scenario "should click a user's post, it redirects me to that post's show page." do
    first('.post > a').click
    expect(page).to have_content('Add a new comment')
    find_button('like post')
    expect(page).to have_content('Comments: 0 Likes: 0')
  end

  scenario 'go to the users post#index page when a user click on view all post' do
    click_button('See all posts')
    expect(page).to have_content(@user.bio)
    expect(page).to have_content("Number of posts: #{@user.posts_counter}")
  end
end