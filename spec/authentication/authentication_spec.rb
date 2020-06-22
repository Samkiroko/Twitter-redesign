require_relative '../rails_helper'

RSpec.feature 'Authentication', type: :feature do
  scenario 'Log in and log out' do
    user = User.create(full_name: 'User Example', username: 'userexample')
    second_user = User.create(full_name: 'Second User', username: 'user2')
    visit root_path
    have_link 'Log In', href: login_path
    have_link 'Sign up', href: signup_path
    click_link 'Sign up'
    expect(page.current_path).to eq signup_path
    have_link 'Login', href: login_path
    click_link 'Login'
    expect(page.current_path).to eq root_path
    page.fill_in 'Username', with: 'userexample'
    click_button 'Log in'
    expect(page.current_path).to eq '/opinions'
    have_link 'Home', href: opinions_path
    have_link 'Profile', href: user_path(user.id)
    have_link 'Log out', href: logout_path
    have_link 'Tweet', href: opinions_path
    have_link 'Second User', href: user_path(second_user.id)
    click_on 'Log out'
    expect(page.current_path).to eq root_path
  end
end
