require 'rails_helper'

describe 'user logs in' do
  it 'as a admin can go to admin categories' do
    admin = User.create(username: 'manoj', password: 'password', role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)


    visit user_path(admin)

    expect(page).to have_content("Welcome #{admin.username}")
    expect(page).to have_link("Categories")
    expect(page).to have_link("Images")

    click_on 'Categories'
    expect(current_path).to eq(categories_path)
  end
end
