require 'rails_helper'

describe 'when user visits idea page' do
  scenario 'a user can edit a idea' do
    admin = User.create(username: 'manoj', password: 'password', role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    category = Category.create!(name: 'Information')

    title = 'idea1'
    content = 'This is my idea'

    idea = Idea.create(user: admin, category: category, title: title, content: content)

    visit user_ideas_path(admin)

    click_on idea.title

    expect(current_path).to eq(user_idea_path(admin, idea))

    expect(page).to have_content(content)
  end
end
