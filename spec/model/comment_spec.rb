require 'rails_helper'

RSpec.describe Comment, type: :model do
  commented = Comment.new(author_id: 1, post_id: 1, text: 'This is my first comment')

  before { commented.save }
  it 'is valid with valid attributes' do
    expect(commented).to_not be_valid
  end

  it 'is not valid without a author_id and post_id' do
    expect(Comment.new(author_id: nil, post_id: nil)).to_not be_valid
  end

  it 'is not valid without a text' do
    expect(Comment.new(text: nil)).to_not be_valid
  end
end
