require 'rails_helper'

describe 'when admin image  page ' do
  scenario ' they can delete image by' do
    title = 'Image1'
    url = 'https://imagejournal.org/wp-content/uploads/bb-plugin/cache/23466317216_b99485ba14_o-panorama.jpg'

    image = Image.create(title: title, url: url)

    visit image_path(image)
    click_on 'Delete'

    expect(current_path).to eq(images_path)

    expect(page).to_not have_content(title)
  end
end
