require 'rails_helper'

RSpec.describe Like, type: :model do
  before(:each) do
    @user = User.create(name: 'John Doe', photo: 'https://i.pravatar.cc/300', bio: 'Alien biologist')
    @post = Post.create(author_id: @user.id, title: 'Hello, world!', text: 'Hello, world! I am John Doe!')
  end

  describe 'initialize' do
    before(:each) do
      @like = Like.new(post_id: @post.id, author_id: @user.id)
    end

    it 'should be valid' do
      expect(@like.valid?).to be(true)
    end

    it 'should be a like' do
      expect(@like).to be_a(Like)
    end

    it 'should have a post id' do
      expect(@like.post_id).to eq(@post.id)
    end

    it 'should have an author id' do
      expect(@like.author_id).to eq(@user.id)
    end
  end

  describe 'methods' do
    it 'should have a method update_like_counter' do
      expect(@post.likes_counter).to eq(0)

      @like = Like.create(post_id: @post.id, author_id: @user.id)
      @post.reload
      expect(@post.likes_counter).to eq(1)
    end
  end
end
