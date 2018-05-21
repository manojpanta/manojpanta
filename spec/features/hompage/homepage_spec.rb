require 'rails_helper'

describe 'when user visits hompage' do
  scenario 'a user can sign up to be a new user' do

    visit root_path
    click_on 'Sign Up'

    expect(current_path).to eq(new_user_path)

    username = 'Manoj'
    password = '1234'

    fill_in 'user[username]', with: username
    fill_in 'user[password]', with: password

    click_on 'Create User'

    expect(current_path).to eq(user_path(User.last))
    expect(page).to have_content("Welcome #{username}")
  end
end
