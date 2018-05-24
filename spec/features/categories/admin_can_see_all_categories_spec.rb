require 'rails_helper'

describe 'admin visits categories index page' do
  it ' allows  admin to see all categories' do
    admin = User.create(username: 'manoj', password: 'password', role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    Category.create(name: 'info')

    visit categories_path

    expect(page).to have_content('ADMIN CATEGORIES')
    expect(page).to have_link('Edit')
    expect(page).to have_link('Delete')
  end

  context 'as  default user ' do
    it ' does not allow  admin to see all categories' do
      user = User.create(username: 'manoj', password: 'password')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit categories_path

      expect(page).to_not have_content('Admin Categories')
      expect(page).to have_content('Categories')
      expect(page).to_not have_link('Edit')
      expect(page).to_not have_link('Delete')
    end
  end
end
