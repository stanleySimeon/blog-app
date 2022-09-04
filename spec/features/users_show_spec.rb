require 'rails_helper'

RSpec.describe 'The users page', type: :feature do
  before :each do
    @user = User.create(name: 'Clara', photo: 'https://pic.png', bio: 'A cute baby', posts_counter: 0)
    visit user_path(@user.id)
  end

  it 'should display the name of each user' do
    expect(page).to have_content @user.name
  end

  it 'should display the avatar of each user' do
    expect(page.first('img')['src']).to have_content @user.photo
  end

  it 'should display the total post number of 3' do
    expect(page).to have_content @user.posts_counter
  end

  it 'should display user bio' do
    expect(page).to have_content @user.bio
  end

  it 'should display the first 3 posts of each user' do
    expect(page).to have_content @user.posts.first
  end

  it 'should display a button with "See all posts" text' do
    expect(page).to have_content 'See all posts'
  end

  it 'should redirect to post page after clicking on "See all posts"' do
    expect(page).to have_current_path user_path(@user.id)
  end
end
