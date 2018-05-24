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
    expect(page).to have_content("WELCOME #{username.upcase}")
  end

  scenario 'a user can not  log in  with wrong password' do
    username = 'manoj'
    password = '1234'
    flash_message = 'Username and Password doesnt match.'
    User.create(username: username, password: password)

    visit root_path
    click_on 'Log In'

    expect(current_path).to eq(login_path)

    fill_in 'username', with: username
    fill_in 'password', with: '12345'
    click_on 'Log In'

    expect(current_path).to eq(login_path)
    expect(page).to have_content(flash_message)
  end
end
