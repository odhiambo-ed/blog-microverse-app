require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'List Users' do
    before(:example) { get '/user' }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it 'renders users index view' do
      expect(response).to render_template(:index)
    end

    it 'shows content in the view' do
      expect(response.body).to include('List of Users')
    end
  end

  # describe 'Show' do
  #   it 'should render show.html.erb view' do
  #     get '/user/1'
  #     expect(response).to render_template('show')
  #   end

  #   it 'should render a user by id' do
  #     get '/user/1'
  #     expect(response.body).to include('Get user by id')
  #   end
  # end
end
