require 'rails_helper'
describe Card do
  describe 'validations' do
    context 'valid attributes' do
      it 'is valid with a image as a string' do
        idea = Card.new(image: 'manoj')
        expect(idea).to be_valid
      end
    end

  end
end
