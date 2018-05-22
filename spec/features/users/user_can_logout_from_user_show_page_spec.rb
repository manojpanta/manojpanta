require 'rails_helper'

describe 'when user visits user page' do
  scenario 'a user can log out from there ' do
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

    click_on 'Log Out'

    expect(current_path).to eq(root_path)
  end
end
