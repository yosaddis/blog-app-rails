require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before(:each) do
    get users_path
  end

  describe 'GET /users' do
    it 'should return a list of users' do
      get '/users'
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /users/:id' do
    it 'should return a user' do
      get '/users/1'
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /index' do
    it 'renders a successful template' do
      expect(response).to render_template(:index)
    end

    it 'renders the correct content' do
      expect(response.body).to include('List of Users')
    end
  end

  describe 'GET /show' do
    before(:each) do
      @user = User.create(name: 'John Doe', photo: 'https://i.pravatar.cc/300', bio: 'Alien biologist',
                          posts_counter: 0)
      get user_show_path(@user)
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the correct content' do
      expect(response.body).to include('User details')
    end
  end
end
