require 'rails_helper'

describe ' user can create a image ' do
  scenario ' as a admin create new image by filling out a form' do
    title = 'Image1'
    url = 'https://imagejournal.org/wp-content/uploads/bb-plugin/cache/23466317216_b99485ba14_o-panorama.jpg'

    admin = User.create(username: 'manoj', password: 'password', role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit images_path
    click_on 'Create New Image'

    expect(current_path).to eq(new_admin_image_path)

    fill_in 'image[title]', with: title
    fill_in 'image[url]', with: url

    click_on 'Create Image'

    expect(current_path).to eq(image_path(Image.last))

    expect(page).to have_content(title)
  end

  scenario ' they can create new image by filling out a form' do
    title = 'Image1'
    title1 = 'my pic'
    title2 = 'pic top'
    title3 = 'top pic'
    url = 'https://imagejournal.org/wp-content/uploads/bb-plugin/cache/23466317216_b99485ba14_o-panorama.jpg'
    admin = User.create(username: 'manoj', password: 'password', role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)


    image1 = Image.create(title: title, url: url)
    image2 = Image.create(title: title1, url: url)
    image3 = Image.create(title: title2, url: url)
    image4 = Image.create(title: title3, url: url)

    visit images_path

    expect(page).to have_content(image1.title)
    expect(page).to have_content(image2.title)
    expect(page).to have_content(image3.title)
    expect(page).to have_content(image4.title)
  end
end
