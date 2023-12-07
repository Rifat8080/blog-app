require 'rails_helper'

RSpec.describe Like, type: :model do
  before(:each) do
    @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    @post = Post.new(author: @user, title: 'My post', text: 'This is my first post')
    @like = Like.new(author: @user, post: @post)
  end

  describe '#validation' do
    it 'is valid with valid attributes' do
      expect(@like).to be_a(Like)
      expect(@like).to be_valid
    end
  end

  describe '#increment_likes_counter' do
    it 'should increment likes_counter' do
      expect(@post.likes_counter).to eq(0)
      @like.save
      expect(@post.likes_counter).to eq(1)
    end
  end
end
