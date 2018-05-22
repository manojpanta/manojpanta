require 'rails_helper'

describe 'when user visits category path' do
  scenario 'a user can delete a category ' do
    name = 'Information'
    category = Category.create(name: name)
    admin = User.create(username: 'manoj', password: 'password', role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)


    visit categories_path

    click_on 'Delete'

    expect(current_path).to eq(categories_path)

    expect(page).to_not have_content(name)
  end
end
