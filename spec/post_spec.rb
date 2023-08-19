require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:each) do
    @user = User.create(name: 'John Doe', photo: 'https://i.pravatar.cc/300', bio: 'Alien biologist')
  end

  describe 'initialize' do
    before(:each) do
      @post = Post.new(author_id: @user.id, title: 'Hello, world!', text: 'Hello, world! I am John Doe!')
    end

    it 'should be valid' do
      expect(@post.valid?).to be(true)
    end

    it 'should be a post' do
      expect(@post).to be_a(Post)
    end

    it 'should have an author id' do
      expect(@post.author_id).to eq(@user.id)
    end

    it 'should have a title' do
      expect(@post.title).to eq('Hello, world!')
    end

    it 'should have a text' do
      expect(@post.text).to eq('Hello, world! I am John Doe!')
    end
  end

  describe 'methods' do
    it 'should update posts counter' do
      expect(@user.posts_counter).to eq(0)

      @post = Post.create(author_id: @user.id, title: 'Hello, world!', text: 'Hello, world! I am John Doe!')
      @user.reload
      expect(@user.posts_counter).to eq(1)
    end
  end

  it 'should return 5 last comments' do
    @post = Post.create(author_id: @user.id, title: 'Hello, world!', text: 'Hello, world! I am John Doe!')
    6.times do |i|
      Comment.create(post_id: @post.id, author_id: @user.id, text: "This is comment ##{i}")
    end
    expect(@post.last_comments.count).to eq(5)
  end

  describe 'validations' do
    before(:each) do
      @post = Post.new(author_id: @user.id, title: 'Hello, world!', text: 'Hello, world! I am John Doe!')
      @post.save
    end

    it 'should validate presence of title' do
      @post.title = nil
      expect(@post.valid?).to be(false)
      expect(@post.errors.include?(:title)).to be(true)
    end

    it 'should validate length of title' do
      @post.title = 'a' * 251
      expect(@post.valid?).to be(false)
      expect(@post.errors.include?(:title)).to be(true)
    end

    it 'should validate numericality of comments_counter' do
      @post.comments_counter = 'a'
      expect(@post.valid?).to be(false)
      expect(@post.errors.include?(:comments_counter)).to be(true)

      @post.comments_counter = -1
      expect(@post.valid?).to be(false)
      expect(@post.errors.include?(:comments_counter)).to be(true)
    end

    it 'should validate numericality of likes_counter' do
      @post.likes_counter = 'a'
      expect(@post.valid?).to be(false)
      expect(@post.errors.include?(:likes_counter)).to be(true)

      @post.likes_counter = -1
      expect(@post.valid?).to be(false)
      expect(@post.errors.include?(:likes_counter)).to be(true)
    end

    it 'should validate if likes_counter is >= 0' do
      @post.likes_counter = -1
      expect(@post.valid?).to be(false)
      expect(@post.errors.include?(:likes_counter)).to be(true)
    end
  end
end
