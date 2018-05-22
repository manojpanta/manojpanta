require 'rails_helper'

describe 'when user visits idea page' do
  scenario 'a user can edit a idea' do
    category = Category.create!(name: 'Information')
    user = User.create(username: 'manoj', password: '1234')


    title = 'idea1'
    content = 'This is my idea'


    idea = Idea.create(user: user, category: category, title: title, content: content)

    visit user_ideas_path(user)

    click_on idea.title

    expect(current_path).to eq(user_idea_path(user, idea))

    expect(page).to have_content(content)
  end
end
