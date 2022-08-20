require 'rails_helper'

RSpec.describe Post, type: :model do
  posted = Post.new(author_id: 1, title: 'My first post', text: 'This is my first post', likes_counter: 0, comments_counter: 0)

  before { posted.save }
  it 'is valid with valid attributes' do
    expect(posted).to_not be_valid
  end

  it 'is not valid without a title' do
    expect(Post.new(title: nil)).to_not be_valid
  end

  it 'is not valid without a text' do
    expect(Post.new(text: nil)).to_not be_valid
  end

  it 'is not valid without a likes_counter' do
    expect(Post.new(likes_counter: nil)).to_not be_valid
  end

  it 'is not valid without a comments_counter' do
    expect(Post.new(comments_counter: nil)).to_not be_valid
  end

  it 'is not valid without a author_id' do
    expect(Post.new(author_id: nil)).to_not be_valid
  end
end
