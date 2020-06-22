require_relative '../rails_helper'

RSpec.feature 'Following', type: :feature do
  before :each do
    @user = User.create(full_name: 'User Example', username: 'userexample')
    @second_user = User.create(full_name: 'Second User', username: 'user2test')
    visit root_path
    page.fill_in 'Username', with: 'userexample'
    click_button 'Log in'
  end

  scenario 'Following a user', type: :feature do
    have_link 'Second User', href: user_path(@second_user.id)
    click_link 'Second User'
    expect(page.current_path).to eq user_path(@second_user.id)
    expect(page).to have_text 'Second User'
    expect(page).to have_text '@user2'
    have_link 'Follow', href: followings_user_path(@second_user.id)
    click_link 'Follow'
    expect(page).to have_text @user.full_name
    have_link 'Unfollow', href: following_path(@second_user.id)
  end
end
