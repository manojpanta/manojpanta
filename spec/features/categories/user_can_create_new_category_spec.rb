require 'rails_helper'

describe 'when user visits home  page' do
  scenario 'a user can create new idea by filling out a form' do
    category = Category.create!(name: 'Information')
    category1 = Category.create!(name: 'Information1')
    category2 = Category.create!(name: 'Information2')

    content = 'This is my idea'
    title = 'idea1'

    visit ideas_path

    click_on 'Create Idea'

    expect(current_path).to eq(new_idea_path)
