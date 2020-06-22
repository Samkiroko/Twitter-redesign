require_relative '../rails_helper'

RSpec.describe Following, type: :model do
  before :each do
    @user1 = User.create(full_name: 'User One', username: 'user1')
    @user2 = User.create(full_name: 'User Two', username: 'user2')
  end

  it 'creates a valid following' do
    following = Following.new(follower_id: @user1.id, followed_id: @user2.id)
    expect(following).to be_valid
  end

  it 'creates a invalid following' do
    following = Following.new(follower_id: '', followed_id: '')
    expect(following).to_not be_valid
  end

  context 'Association tests' do
    it 'belongs to follower' do
      assc = Following.reflect_on_association(:follower)
      expect(assc.macro).to eq :belongs_to
    end

    it 'belongs to followed' do
      assc = Following.reflect_on_association(:followed)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
