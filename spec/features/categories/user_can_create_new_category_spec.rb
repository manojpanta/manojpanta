require 'rails_helper'

describe 'when user visits categories path' do
  scenario 'a user as a admin can create new category ' do
    admin = User.create(username: 'manoj', password: 'password', role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit categories_path
    click_on 'Create New Category'

    expect(current_path).to eq(new_admin_category_path)

    name = 'Information'

    fill_in 'category[name]', with: name

    click_on 'Create Category'

    expect(current_path).to eq(categories_path)
    expect(page).to have_content(name)
  end
end
