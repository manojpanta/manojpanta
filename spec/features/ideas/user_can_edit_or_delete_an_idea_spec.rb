require 'rails_helper'

describe 'when user visits idea page' do
  scenario 'a user can edit a idea' do
    category = Category.create!(name: 'Information')

    content1 = 'This is my idea'
    title1 = 'idea1 '

    content2 = 'this is my idea too'
    title2 = 'idea2 '

    idea = Idea.create(category: category, title: title1, content: content1)

    visit idea_path(idea)

    click_on 'Edit'

    expect(current_path).to eq(edit_idea_path(idea))


    fill_in 'idea[content]', with: content2
    fill_in 'idea[title]', with: title2
    click_on 'Update Idea'

    expect(current_path).to eq(idea_path(idea))


    expect(page).to have_content(content2)
    expect(page).to have_content(title2)
    expect(page).to_not have_content(content1)
    expect(page).to_not have_content(title1)
  end
  scenario 'a user can delete an idea' do
    category = Category.create!(name: 'Information')

    content = 'This is my idea'
    title = 'idea1 '

    idea = Idea.create(category: category, title: title, content: content)

    visit idea_path(idea)

    click_on 'Delete'

    expect(current_path).to eq(ideas_path)

    expect(page).to_not have_content(title)
  end
end
