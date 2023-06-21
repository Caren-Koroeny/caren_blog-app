require 'rails_helper'

RSpec.describe User, type: :model do
  # tests go here
  subject { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }

  before { subject.save }

  it 'expects post title to be invalid' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Likes Counter attribute should be greater or equal to zero' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  it 'User should have a name' do
    expect(subject.name).to be_present
  end

  it 'User should have a photo' do
    expect(subject.photo).to be_present
  end

  it 'User should have a bio' do
    expect(subject.bio).to be_present
  end

  describe '#returns_last_three_post' do
    let(:user) { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }

    it 'returns the last three posts' do
      user.posts.build(title: 'Post 1')
      post2 = user.posts.build(title: 'Post 2')
      post3 = user.posts.build(title: 'Post 3')
      post4 = user.posts.build(title: 'Post 4')

      user.save

    end
  end
end
