require 'rails_helper'

describe 'when user visits categories path' do
  scenario 'a user can delete a category ' do
    name = 'Information'

    category = Category.create(name: name)

    visit categories_path

    click_on 'Delete'

    expect(current_path).to eq(categories_path)

    expect(page).to_not have_content(name)
  end

  scenario 'a user can delete a category ' do
    name = 'Information'

    category = Category.create(name: name)

    visit categories_path

    click_on 'Edit'

    expect(current_path).to eq(edit_category_path(category))

    name1 = 'Excercise'

    fill_in 'category[name]', with: name1

    click_on 'Update Category'

    expect(current_path).to eq(category_path(category))
    expect(page).to have_content(name1)
    expect(page).to_not have_content(name)


  end
end
