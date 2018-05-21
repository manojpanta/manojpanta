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



    fill_in 'idea[content]', with: content
    fill_in 'idea[title]', with: title
    select 'Information', from: 'idea_category_id'
    click_on 'Create Idea'


    expect(current_path).to eq(ideas_path)

    expect(page).to have_content(Idea.last.content)
    expect(page).to have_content(Idea.last.title)
  end
end
