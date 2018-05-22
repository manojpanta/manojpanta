require 'rails_helper'

describe 'when user visits user home  page' do
  scenario 'a user can log in ' do
    username = 'manoj'
    password = '1234'
    user = User.create(username: username, password: password)

    visit root_path
    click_on 'Log In'

    expect(current_path).to eq(login_path)


    fill_in 'username', with: username
    fill_in 'password', with: '1234'
    click_on 'Log In'

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Welcome #{username}")
  end
end
