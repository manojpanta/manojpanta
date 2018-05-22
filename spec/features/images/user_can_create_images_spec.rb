require 'rails_helper'

describe 'when admin images home page ' do
  scenario ' they can create new image by filling out a form' do
    title = 'Image1'
    url = 'https://imagejournal.org/wp-content/uploads/bb-plugin/cache/23466317216_b99485ba14_o-panorama.jpg'

    visit images_path
    click_on 'Create New Image'

    expect(current_path).to eq(new_image_path)

    fill_in 'image[title]', with: title
    fill_in 'image[url]', with: url

    click_on 'Create Image'

    expect(current_path).to eq(image_path(Image.last))

    expect(page).to have_content(title)
  end
end
