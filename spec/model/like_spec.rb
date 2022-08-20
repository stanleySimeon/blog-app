require 'rails_helper'

RSpec.describe Like, type: :model do
  liked = Like.new(author_id: 1, post_id: 1)

  before { liked.save }
  it 'is valid with valid attributes' do
    expect(liked).to_not be_valid
  end

  it 'is not valid without a author_id and post_id' do
    expect(Like.new(author_id: nil, post_id: nil)).to_not be_valid
  end
end
