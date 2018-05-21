require 'rails_helper'

describe 'when user visits category path' do
  scenario 'a user can delete a category ' do
    name = 'Information'

    category = Category.create(name: name)

    visit category_path(category)

    click_on 'Delete'

    expect(current_path).to eq(categories_path)

    expect(page).to_not have_content(name)
  end
end
