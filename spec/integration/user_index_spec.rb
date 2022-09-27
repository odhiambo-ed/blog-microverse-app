require 'rails_helper'

RSpec.describe 'Test User Index Page', type: :feature do
  describe 'GET index' do
    before(:each) do
      @first_user = User.create(name: 'Rose', photo: 'image1.png', bio: 'This my first life story', posts_counter: 1)
      @first_user.save!
      @second_user = User.create(name: 'Lillian', photo: 'image2.png', bio: 'This my second life story', posts_counter: 5)
      @second_user.save!
      @third_user = User.create(name: 'Swine', photo: 'image3.png', bio: 'This my third life story', posts_counter: 4)
      @third_user.save!
    end

    it 'shows the users username' do
      visit '/'
      expect(page).to have_content('Rose')
      expect(page).to have_content('Lillian')
      expect(page).to have_content('Swine')
    end

    it 'shows the users profile picture' do
      visit '/'
      expect(page).to have_css('img[src*="image1.png"]')
      expect(page).to have_css('img[src*="image2.png"]')
      expect(page).to have_css('img[src*="image3.png"]')
    end

    it 'shows the number of posts of each user' do
      visit '/'
      expect(page).to have_content('1')
      expect(page).to have_content('5')
      expect(page).to have_content('4')
    end
  end
end 