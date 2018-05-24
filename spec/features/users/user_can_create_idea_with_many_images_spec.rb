require 'rails_helper'

describe 'user can create idea' do
  it 'with many images' do
    admin = User.create(username: 'manoj', password: 'password', role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)


    visit user_path(admin)

    expect(page).to have_content("WELCOME #{admin.username.upcase}")
    expect(page).to have_link("Categories")
    expect(page).to have_link("Images")

    click_on 'Categories'
    expect(current_path).to eq(categories_path)
  end
end
