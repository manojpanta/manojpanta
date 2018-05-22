require 'rails_helper'
describe Image do
  describe 'validations' do
    context 'invalid attributes' do
      it 'is invalid without a title' do
        image = Image.new(url: 'https://imagejournal.org/wp-content/uploads/bb-plugin/cache/23466317216_b99485ba14_o-panorama.jpg')
        expect(image).to be_invalid
      end
    end
    context 'invalid attributes' do
      it 'is invalid without a url' do
        image = Image.new(title: 'image1')
        expect(image).to be_invalid
      end
    end
    context 'valid attributes' do
      it 'is valid with url and a title' do
        image = Image.new(title: 'title1', url: 'https://imagejournal.org/wp-content/uploads/bb-plugin/cache/23466317216_b99485ba14_o-panorama.jpg')
        expect(image).to be_valid
      end
    end
  end
end
