require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:each) do
      @user = User.create(name: 'John Doe', photo: 'https://i.pravatar.cc/300', bio: 'Alien biologist',
                          posts_counter: 0)
      get user_posts_path(@user)
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end

    it 'renders the correct content' do
      expect(response.body).to include('All Posts')
    end
  end

  describe 'GET /show' do
    before(:each) do
      @user = User.create(name: 'John Doe', photo: 'https://i.pravatar.cc/300', bio: 'Alien biologist',
                          posts_counter: 0)
      @post = Post.create(author_id: @user.id, title: 'Hello World', text: 'This is my test post')
      get user_post_path(@user, @post)
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns the show template' do
      expect(response).to render_template(:show)
    end

    it 'renders the correct content' do
      expect(response.body).to include('Show posts by user')
    end
  end
end
