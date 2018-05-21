require 'rails_helper'

describe 'when user visits categories path' do
  scenario 'a user can create new category ' do

    visit categories_path
    click_on 'Create New Category'

    expect(current_path).to eq(new_category_path)

    name = 'Information'

    fill_in 'category[name]', with: name

    click_on 'Create Category'

    expect(current_path).to eq(category_path(Category.last))
    expect(page).to have_content(name)
  end
end
