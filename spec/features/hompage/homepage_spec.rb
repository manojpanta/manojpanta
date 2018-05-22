require 'rails_helper'
describe 'when user visits hompage' do
  scenario 'a user can sign up to be a new user' do
    visit root_path
    click_on 'Sign Up'

    expect(current_path).to eq(new_user_path)

    username = 'Manoj'
    password = '1234'

    fill_in 'user_username', with: username
    fill_in 'user_password', with: password

    click_on 'Create User'

    expect(current_path).to eq(user_path(User.last))
    expect(page).to have_content("Welcome #{username}")
  end

  scenario 'a user can not  sign up with already taken user name' do
    username = 'Manoj'
    password = '1234'
    flash_message = 'Username Already Taken!'

    User.create(username: username, password: password)

    visit root_path
    click_on 'Sign Up'

    fill_in 'user_username', with: username
    fill_in 'user_password', with: password

    click_on 'Create User'

    expect(page).to have_content(flash_message)

    expect(current_path).to eq(users_path)
  end
end
