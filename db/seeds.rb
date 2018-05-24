Idea.destroy_all
Image.destroy_all
Category.destroy_all
User.destroy_all

IMAGES = ["https://wallpaperbrowse.com/media/images/soap-bubble-1958650_960_720.jpg", "https://wallpaperbrowse.com/media/images/cat-1285634_960_720.png", "http://illinoisdouble.com/wp-content/uploads/pictures-images-amazing-wonderful-macro-photography-of-nature-pics-pictures-images.jpg", "https://www.bmw.com.mt/content/dam/bmw/common/all-models/m-series/m4-convertible/2017/images-and-videos/images/BMW-m4-convertible-images-and-videos-1920x1200-06.jpg.asset.1510607725528.jpg",                "https://i1.wp.com/thefreshimages.com/wp-content/uploads/2017/08/lord-shiva-images-12.jpg?resize=564%2C560&ssl=1", "https://www.pixelstalk.net/wp-content/uploads/images1/HD-Bridge-Pictures.jpg", "https://media.mnn.com/assets/images/2018/01/black-hole-simul.jpg.653x0_q80_crop-smart.jpg", "https://www.imperial.ac.uk/news/image/mainnews2012/31831.jpg", "http://getwallpapers.com/wallpaper/full/c/5/2/780609-cool-awesome-wallpapers-1920x1200-images.jpg"]
IDEAS = ["Sky Is Blue", "Earth Is Round", "Pizza Is Triangle", "Cone Is Conilar", "Car Is Expensive", "Judson Is Loud", "Steve Is Wazniak", "Tyler Is Lizard", "Zach Is 3D Printererrr!", "Matt Is Sergeant","Jude Is Backbencher"]
CONTENTS = ["Never criticize someone until you've walked a mile in their shoes. That way, when you criticize them, they won't be able to hear you from that far away. Plus, you'll have their shoes.", "Two fish are in a tank. One says to the other, 'Do you know how to drive this thing?'", "The machine at the coin factory just suddenly stopped working, with no explanation. It doesn't make any cents!", "Have you heard the one about the bad pole-vaulter? It never goes over very well.", "Cleaning with kids in the house is like brushing your teeth with Oreos."]
TITLES = ['Back to Brooklyn', 'Backlash', 'Bad Dog', 'Bad Ideas', 'Bad Planet', 'Badger', 'Badrock', 'Bastard Samurai', 'Battle Chasers', 'Battle Hymn', 'Battle of the Planet','Battle of the Planets: Coup de Gras']
CATEGORIES = ['FACTS', 'GUESSES', 'SCIENCE', 'CLASS FACTS', 'ASSUMPTION', 'THOUGHTS']

categories = []
CATEGORIES.each do |c|
  categories << Category.create!(name:c)
end

images = []
IMAGES.each do |i|
  images << Image.create!(url: i, title: TITLES.sample)
end

user = User.create!(username: 'manoj', password: 'manoj', role: 1)
user1 = User.create!(username: 'manoj1', password: 'manoj', role: 0)

IDEAS.each do |c|
  idea = user.ideas.create!(title: c, category: categories.sample, content: CONTENTS.sample)
  idea1 = user1.ideas.create!(title: c, category: categories.sample, content: CONTENTS.sample)
  2.times do
    idea.images << images.sample
    idea1.images << images.sample
  end
end
