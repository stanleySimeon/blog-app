require 'rails_helper'

RSpec.describe 'The index users page', type: :feature do
  before :each do
    @user = User.create(name: 'Martial', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Full-Stack Software Engineer', posts_counter: 5)
    @post = Post.create(title: 'Love must lead', text: 'This is my first post', likes_counter: 0, comments_counter: 0, author: @user)
    @comment = Comment.create(text: 'This is my first comment', post: Post.first, author: User.first)
    visit user_posts_path(user_id: @user.id)
  end

  it 'should display the post title' do
    expect(page).to have_content @post.title
  end

  it 'should display who wrote the post' do
    expect(page).to have_content @user.name
  end

  it 'should display the number of comments it has' do
    expect(page).to have_content @post.comments_counter
  end

  it 'should display the number of likes it has' do
    expect(page).to have_content @post.likes_counter
  end

  it 'should display the post body' do
    expect(page).to have_content @post.text
  end

  it 'should display the username of all commentor' do
    expect(page).to have_content @comment.author.name
  end

  it 'should display the comment of each commentor' do
    expect(page).to have_content @comment.text
  end
end
