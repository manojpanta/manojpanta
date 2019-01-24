require 'rails_helper'
describe 'when user visits hompage' do
  scenario 'a user can play a game ' do
    admin = User.create(username: 'manoj', password: 'password', role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit user_path(admin)
    click_on 'Play Game'

    expect(page).to have_content('Welcome To MindReader')
    expect(page).to have_content('Please Choose one of the following cards in your mind and remember for next round.')



  end
end
