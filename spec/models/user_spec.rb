
require 'rails_helper'

describe User do
  describe 'validations' do
    context 'invalid attributes' do
      it 'is invalid without a username' do
        user = User.new(password: '1234')
        expect(user).to be_invalid
      end
      it 'is invalid without a password' do
        user = User.new(username: 'manoj')
        expect(user).to be_invalid
      end
    end
    context 'valid attributes' do
      it 'is valid without a username and password' do
        user = User.new(password: '1234', username: 'manoj')
        expect(user).to be_valid
      end
    end
  end
end
