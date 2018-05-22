require 'rails_helper'

describe 'when user visits user home  page' do
  scenario 'a user can log in and create a new idea' do
    username = 'manoj'
    password = '1234'
    content = 'This is my idea'
    title = 'idea1'
    Category.create!(name: 'Information')
    Category.create!(name: 'Information1')
    Category.create!(name: 'Information2')
    user = User.create(username: username, password: password)

    visit root_path
    click_on 'Log In'

    fill_in 'username', with: username
    fill_in 'password', with: password
    click_on 'Log In'

    expect(current_path).to eq(user_path(user))

    click_on 'Create New Idea'

    expect(current_path).to eq(new_user_idea_path(user))

    fill_in 'idea[content]', with: content
    fill_in 'idea[title]', with: title
    select 'Information', from: 'idea_category_id'
    click_on 'Create Idea'

    expect(current_path).to eq(user_idea_path(user, Idea.last))
    expect(page).to have_content(title)
    expect(page).to have_content(content)
  end
end
