require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:each) do
    @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    @post = Post.new(author: @user, title: 'My post', text: 'This is my first post')
    @comment = Comment.new(author: @user, post: @post, text: 'This is my first comment')
  end

  describe '#validation' do
    it 'is valid with valid attributes' do
      expect(@comment).to be_a(Comment)
      expect(@comment).to be_valid
    end
  end

  describe '#increment_comments_counter' do
    it 'should increment comments_counter' do
      expect(@post.comments_counter).to eq(0)
      @comment.save
      expect(@post.comments_counter).to eq(1)
    end
  end
end
