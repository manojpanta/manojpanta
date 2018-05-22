require 'rails_helper'
describe Idea do
  describe 'validations' do
    context 'invalid attributes' do
      it 'is invalid without a title' do
        idea = Idea.new(content: 'this is an idea')
        expect(idea).to be_invalid
      end
    end

    context 'invalid attributes' do
      it 'is invalid without a content' do
        idea = Idea.new(title: 'idea')
        expect(idea).to be_invalid
      end
    end

    context 'valid attributes' do
      it 'is valid with content and a title' do
        category = Category.create(name: 'Information')
        user = User.create(username: 'manoj', password: '1234')

        idea = Idea.new(user: user, category: category,title: 'idea', content: 'this is an idea')
        expect(idea).to be_valid
      end
    end

    context 'relationships' do
      it 'should respond to category' do
        category = Category.create(name: 'Information')
        idea = Idea.new(category: category,title: 'idea', content: 'this is an idea')
        expect(idea).to respond_to(:category)
      end
      it 'should respond to ideaimages' do
        category = Category.create(name: 'Information')
        idea = Idea.new(category: category,title: 'idea', content: 'this is an idea')
        expect(idea).to respond_to(:ideas_images)
      end

      it 'should respond to images' do
        category = Category.create(name: 'Information')
        idea = Idea.new(category: category,title: 'idea', content: 'this is an idea')
        expect(idea).to respond_to(:images)
      end
    end
  end
end
