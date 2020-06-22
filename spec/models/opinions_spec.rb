require_relative '../rails_helper'

RSpec.describe Opinion, type: :model do
  context 'Validation tests' do
    subject { Opinion.new }
    let(:create_opinion) { User.new(full_name: 'Test User', username: 'testuser') }

    it 'is valid with valid attributes' do
      subject.text = 'Test opinion'
      subject.user = create_opinion
      expect(subject).to be_valid
    end

    it 'is not valid without text' do
      expect(subject).to_not be_valid
    end
  end

  context 'Association tests' do
    it 'belongs to user' do
      assc = Opinion.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
