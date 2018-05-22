require 'rails_helper'
describe 'when user visits user show page' do
  scenario 'a user can see all their ideas' do
    username = 'manoj'
    password = '1234'
    content = 'This is my idea'
    title = 'idea1'
    category = Category.create!(name: 'Information')
    category1 = Category.create!(name: 'Information1')
    category2 = Category.create!(name: 'Information2')

    user = User.create(username: username, password: password)
    idea1 = Idea.create(user: user, title: title, content: 'walk slowly', category: category)
    idea2 = Idea.create(user: user, title: content, content: 'run slowly', category: category1)
    idea3 = Idea.create(user: user, title: 'climbing', content: 'climb slowly', category: category2)
    idea4 = Idea.create(user: user, title: 'jogging', content: 'jog slowly', category: category)

    visit root_path
    click_on 'Log In'

    fill_in 'username', with: username
    fill_in 'password', with: password
    click_on 'Log In'

    expect(current_path).to eq(user_path(user))

    expect(page).to have_content(idea1.title)
    expect(page).to have_content(idea2.title)
    expect(page).to have_content(idea3.title)
    expect(page).to have_content(idea4.title)
  end
  scenario 'user can go to specific idea by clicking on idea' do
    username = 'manoj'
    password = '1234'
    content = 'This is my idea'
    title = 'idea1'
    category = Category.create!(name: 'Information')

    user = User.create(username: username, password: password)
    idea = Idea.create(user: user, title: title, content: content, category: category)

    visit root_path
    click_on 'Log In'

    fill_in 'username', with: username
    fill_in 'password', with: password
    click_on 'Log In'

    click_on idea.title

    expect(current_path).to eq(user_idea_path(user, idea))

    expect(page).to have_content(idea.title)
    expect(page).to have_content(idea.content)
  end
  scenario 'user can delete idea by clicking on delete next to idea' do
    username = 'manoj'
    password = '1234'
    content = 'This is my idea'
    title = 'idea1'
    category = Category.create!(name: 'Information')

    user = User.create(username: username, password: password)
    idea = Idea.create(user: user, title: title, content: content, category: category)

    visit root_path
    click_on 'Log In'

    fill_in 'username', with: username
    fill_in 'password', with: password
    click_on 'Log In'

    click_on 'Delete'

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("#{idea.title} Deleted!")
  end
  scenario 'user can update and idea by clicking on edit next to idea' do
    username = 'manoj'
    password = '1234'
    content = 'This is my idea'
    title = 'idea1'

    content1 = 'This is not my idea'
    title1 = 'idea2'

    Category.create!(name: 'Information')
    category = Category.create!(name: 'Technology')

    user = User.create(username: username, password: password)
    idea = Idea.create(user: user, title: 'walking', content: 'walk slowly', category: category)

    visit root_path
    click_on 'Log In'

    fill_in 'username', with: username
    fill_in 'password', with: password
    click_on 'Log In'

    click_on 'Edit'

    fill_in 'idea[content]', with: content1
    fill_in 'idea[title]', with: title1
    select category.name, from: 'idea_category_id'
    click_on 'Update Idea'

    expect(current_path).to eq(user_idea_path(user, idea))
    expect(page).to have_content("#{title1} Updated!")
    expect(page).to have_content(content1)
    expect(page).to have_content(title1)

    expect(page).to_not have_content(content)
    expect(page).to_not have_content(title)
  end
end
