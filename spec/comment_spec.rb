require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:each) do
    @user = User.create(name: 'John Doe', photo: 'https://i.pravatar.cc/300', bio: 'Alien biologist')
    @post = Post.create(author_id: @user.id, title: 'Hello, world!', text: 'Hello, world! I am John Doe!')
  end

  describe 'initialize' do
    before(:each) do
      @comment = Comment.new(post_id: @post.id, author_id: @user.id, text: 'This is a comment')
    end

    it 'should be valid' do
      expect(@comment.valid?).to be(true)
    end

    it 'should be a comment' do
      expect(@comment).to be_a(Comment)
    end

    it 'should have a post id' do
      expect(@comment.post_id).to eq(@post.id)
    end

    it 'should have an author id' do
      expect(@comment.author_id).to eq(@user.id)
    end

    it 'should have a text' do
      expect(@comment.text).to eq('This is a comment')
    end
  end

  describe 'methods' do
    it 'should have a method update_comment_counter' do
      expect(@post.comments_counter).to eq(0)

      @comment = Comment.create(post_id: @post.id, author_id: @user.id, text: 'This is a comment')
      @post.reload
      expect(@post.comments_counter).to eq(1)
    end
  end
end
