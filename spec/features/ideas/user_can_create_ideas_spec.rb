require 'rails_helper'

describe 'when user visits home  page' do
  scenario 'a user can create new idea by filling out a form' do
    Category.create!(name: 'Information')
    Category.create!(name: 'Information1')
    Category.create!(name: 'Information2')
    user = User.create!(username: 'manoj', password: '123')

    content = 'This is my idea'
    title = 'idea1'

    visit new_user_idea_path(user)

    fill_in 'idea[content]', with: content
    fill_in 'idea[title]', with: title
    select 'Information', from: 'idea_category_id'
    click_on 'Create Idea'

    expect(current_path).to eq(user_idea_path(user, Idea.last))

    expect(page).to have_content(Idea.last.title)
  end
end
