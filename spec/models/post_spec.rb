require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Creation' do
    subject do
      user1 = User.new(Name: 'Janet', Photo: 'https://unsplash.com/photos/2LowviVHZ-F',
                       Bio: 'I am twenty two years old', PostsCounter: 0)
      Post.new(Title: 'Hello World', Text: 'This is my first post and I am happy', CommentsCounter: 2, LikesCounter: 3,
               author_id: user1.id)
    end

    before { subject.save }

    it 'title must not be blank' do
      subject.Title = nil
      expect(subject).to_not be_valid
    end

    it 'title must not exceed 250 characters' do
      subject.Title = 'b' * 251
      expect(subject).to_not be_valid
    end

    it 'commentscounter must be an integer' do
      subject.CommentsCounter = 0.01
      expect(subject).to_not be_valid
    end

    it 'commentscounter must be greater than or equal to zero' do
      subject.CommentsCounter = -1
      expect(subject).to_not be_valid
    end

    it 'likescounter must be greater than or equal to zero' do
      subject.LikesCounter = -1
      expect(subject).to_not be_valid
    end
  end
end
