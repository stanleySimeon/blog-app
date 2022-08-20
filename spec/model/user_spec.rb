require 'rails_helper'

RSpec.describe User, type: :model do
  author = User.new(name: 'John Doe',
                    photo: 'https://www.example.com/photo.png',
                    bio: 'I am a very good writer', posts_counter: 0)

  before { author.save }
  it 'is valid with valid attributes' do
    expect(author).to be_valid
  end

  it 'is not valid without a name' do
    expect(User.new(name: nil)).to_not be_valid
  end

  it 'is not valid without a photo' do
    expect(User.new(photo: nil)).to_not be_valid
  end

  it 'is not valid without a bio' do
    expect(User.new(bio: nil)).to_not be_valid
  end

  it 'is not valid without a posts_counter' do
    expect(User.new(posts_counter: nil)).to_not be_valid
  end
end

RSpec.describe Post, type: :model do
  describe 'validations for the post model' do
    before(:each) do
      @user = User.new(name: 'John', bio: "I'm a Full-Stack Softwaare Engineer", posts_counter: 0)
      @post = Post.new(title: 'My first post', text: 'This is my first post', likes_counter: 0, comments_counter: 0,
                       author: @user)
    end
  end
end
