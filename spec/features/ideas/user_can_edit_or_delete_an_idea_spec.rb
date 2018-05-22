require 'rails_helper'

describe 'when user visits idea page' do
  scenario 'a user can edit a idea' do
    category = Category.create!(name: 'Information')
    user = User.create(username: 'manoj', password: '1234')

    content1 = 'This is my idea'
    title1 = 'idea1 '

    content2 = 'this is my idea too'
    title2 = 'idea2 '

    idea = Idea.create(user: user, category: category, title: title1, content: content1)

    visit user_idea_path(user, idea)

    click_on 'Edit'

    expect(current_path).to eq(edit_user_idea_path(user, idea))


    fill_in 'idea[content]', with: content2
    fill_in 'idea[title]', with: title2
    click_on 'Update Idea'

    expect(current_path).to eq(user_idea_path(user, idea))


    expect(page).to have_content(content2)
    expect(page).to have_content(title2)
    expect(page).to_not have_content(content1)
    expect(page).to_not have_content(title1)
  end
  scenario 'a user can delete an idea' do
    category = Category.create!(name: 'Information')
    user = User.create(username: 'manoj', password: '1234')

    content = 'This is my idea'
    title = 'idea1'

    idea = Idea.create(user: user, category: category, title: title, content: content)

    visit user_idea_path(user, idea)

    click_on 'Delete'

    expect(current_path).to eq(user_ideas_path(user))

    expect(page).to have_content("#{title} Deleted!")
  end
end
