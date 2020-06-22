require_relative '../rails_helper'

RSpec.describe User, type: :model do
  context 'Validation tests' do
    it 'validates full name and username - invalid' do
      user = User.new(full_name: '', username: '')
      expect(user.valid?).to be(false)
    end

    it 'validates full name and username - valid' do
      user = User.new(full_name: 'Test User', username: 'testuser')
      expect(user.valid?).to be(true)
    end
  end

  context 'Association tests' do
    it 'has many opinions' do
      assc = User.reflect_on_association(:opinions)
      expect(assc.macro).to eq :has_many
    end

    it 'has many followings' do
      assc = User.reflect_on_association(:followings)
      expect(assc.macro).to eq :has_many
    end

    it 'has many followers' do
      assc = User.reflect_on_association(:followers)
      expect(assc.macro).to eq :has_many
    end
  end
end
