require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'List Posts' do
    it "should render 'index.html.erb' view" do
      get '/user/1/post'
      expect(response.body).to include('list of posts for a given user')
    end

    it 'should render user/1/posts/index' do
      get '/user/1/post'
      expect(response).to have_http_status(200)
      expect(response).to render_template('index')
    end
  end

  describe 'Show Post' do
    it "should render 'show.html.erb' view" do
      get '/user/1/post/1'
      expect(response.body).to include('Get post by id')
    end

    it "should render 'show.html.erb' view" do
      get '/user/1/post/1'
      expect(response.body).to render_template('show')
    end
  end
end