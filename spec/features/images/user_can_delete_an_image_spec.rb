require 'rails_helper'

describe 'when admin visits admin images  page ' do
  scenario ' they can delete image by clicking on delete' do
    title = 'Image1'

    url = 'https://imagejournal.org/wp-content/uploads/bb-plugin/cache/23466317216_b99485ba14_o-panorama.jpg'
    admin = User.create(username: 'manoj', password: 'password', role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    image = Image.create(title: title, url: url)

    visit images_path(image)
    click_on 'Delete'

    expect(current_path).to eq(images_path)

    expect(page).to_not have_content(title)
  end
end
