require 'rails_helper'

RSpec.describe 'The index users page', type: :feature do
  before :each do
    @user = User.create(name: 'Martial', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Full-Stack Software Engineer', posts_counter: 5)
    @post = Post.create(title: 'Love must lead', text: 'This is my first post', likes_counter: 0, comments_counter: 0, author: @user)
    @comment = Comment.create(text: 'This is my first comment', post: Post.first, author: User.first)
    visit user_posts_path(user_id: @user.id)
  end

  it "shouls display the user's avatar" do
    expect(page.first('img')['src']).to have_content @user.photo
  end

  it "shouls display the user's name" do
    expect(page).to have_content @user.name
  end

  it 'should display the number of posts that the user has written' do
    expect(page).to have_content @user.posts_counter
  end

  it 'should display the post title' do
    expect(page).to have_content @post.title
  end

  it "should display post's body" do
    expect(page).to have_content @post.text
  end

  it 'should display the first comment on a post' do
    expect(page).to have_content @comment.text
  end

  it 'should display the number of comments on a post' do
    expect(page).to have_content @post.comments_counter
  end

  it 'should display the number of likes on a post' do
    expect(page).to have_content @post.likes_counter
  end

  it 'should display a section of pagination' do
    expect(page).to have_content '1'
  end

  it 'should redirect to the post show page when a post is clicked' do
    expect(page).to have_current_path user_posts_path(user_id: @user.id)
  end
end
