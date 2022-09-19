require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'List Users' do
    it "The method should render index.html.erb view" do
      get '/user'
      expect(response).to render_template('index')
    end

    it "the method should render a list of all users " do
      get '/user'
      expect(response.body).to include('list of all users')
      expect(response).to have_http_status(200)
    end
  end

  describe 'Show' do
    it 'should render show.html.erb view' do
      get '/user/2'
      expect(response).to render_template('show')
    end

    it 'should render a user by id' do
      get '/user/2'
      expect(response.body).to include('Get user by id')
    end
  end
end
