require 'rails_helper'

RSpec.describe 'Users pages index', type: :feature do
  before :each do
    @user = User.create(name: 'Clara', photo: 'https://mybaby.png', bio: 'A cute baby', posts_counter: 0)
    visit users_path
  end

  it "should display all user's name" do
    expect(page).to have_content @user.name
  end

  it 'should set the link of the picture to the img src' do
    expect(page.first('img')['src']).to have_content @user.photo
  end

  it 'should display the total post number of users' do
    expect(page).to have_content @user.posts_counter
  end

  it "Should navigate to user's show page" do
    expect(page).to have_current_path users_path
  end
end
