require_relative '../rails_helper'

RSpec.feature 'Create Opinion', type: :feature do
  before :each do
    user = User.create(full_name: 'User Name', username: 'username')
    opinion = user.opinions.build(text: 'Test opinion')
    opinion.save
    visit root_path
    page.fill_in 'Username', with: 'username'
    click_button 'Log in'
  end

  scenario 'Opinion creation', type: :feature do
    expect(page.current_path).to eq '/opinions'
    page.fill_in 'opinion[text]', with: 'Test opinion'
    click_button 'Tweet'
    expect(page).to have_text 'Test opinion'
    expect(page).to have_text 'less than a minute ago'
  end
end
