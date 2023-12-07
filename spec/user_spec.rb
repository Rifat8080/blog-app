require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  end

  describe '#validation' do
    it 'is valid with valid attributes' do
      expect(@user).to be_a(User)
      expect(@user).to be_valid
    end

    it 'is invalid without name' do
      bad_user = User.create(photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
      expect(bad_user).not_to be_valid
      expect(bad_user.errors.include?(:name)).to eq(true)
    end

    it 'post_counter should be greater than or equal to 0' do
      bad_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                             bio: 'Teacher from Mexico.', posts_counter: -1)
      expect(bad_user).not_to be_valid
      expect(bad_user.errors.include?(:posts_counter)).to eq(true)
    end
  end

  describe '#name' do
    it 'should not be valid without name' do
      bad_user = User.create(photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
      expect(bad_user).not_to be_valid
      expect(bad_user.errors.include?(:name)).to eq(true)
    end
  end

  describe '#recent_posts' do
    it 'should return a list of recent posts' do
      expect(@user.recent_posts).to eq(@user.posts.order(created_at: :desc).limit(3))
    end
  end
end
