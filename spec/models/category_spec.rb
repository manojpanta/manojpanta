require 'rails_helper'
describe Category do
  describe 'validations' do
    context 'invalid attributes' do
      it 'is invalid without a name' do
        category = Category.new
        expect(category).to be_invalid
      end
    end

    context 'valid attributes' do
      it 'is valid with a name' do
        category = Category.new(name: 'category')
        expect(category).to be_valid
      end
    end

    context 'relationships' do
      it 'should respond to idea' do
        category = Category.create(name: 'Information')
        expect(category).to respond_to(:ideas)
      end
    end
  end
end
