Photo.destroy_all
Category.destroy_all
User.destroy_all

music = Category.create(name: "Music")
live_music = Category.create(name: "Live Music")
sport = Category.create(name: "Sport")
social_and_drinks = Category.create(name: "Social and Drinks")
fun_and_games = Category.create(name: "Fun and Games")

ant = User.create!({email: "ant@gmail.com", password: "123456"})
davey = User.create(email: "davey@gmail.com", password: "123456")
sandra = User.create(email: "sandra@gmail.com", password: "123456")
sam = User.create(email: "sam@gmail.com", password: "123456")

event_1 = Event.create!({
  name: "Party in Centraal!",
  description: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium",
  location: "Amsterdam",
  price: 5,
  capacity: 2000,
  includes_food: true,
  includes_drink: true,
  starts_at: DateTime.parse("10/11/2009 17:00"),
  ends_at: DateTime.parse("09/01/2009 17:00"),
  active: true,
  user: ant,
  categories: [fun_and_games, social_and_drinks]
  })

event_2 = Event.create!({
  name: "Live Music Jam, anybody is welcome!",
  description: "Bring your own drinks! :)",
  location: "Amsterdam",
  price: 5,
  capacity: 10,
  includes_food: true,
  includes_drink: false,
  starts_at: 04112017,
  ends_at: 04112017,
  active: true,
  user: davey,
  categories: [music, live_music]
  })

event_3 = Event.create!({
  name: "Football Games: 5-a-Side Tournament",
  description: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium",
  location: "Amsterdam",
  price: 5,
  capacity: 20,
  includes_food: true,
  includes_drink: true,
  starts_at: 04112017,
  ends_at: 04112017,
  active: true,
  user: sandra,
  categories: [sport]
  })

event_4 = Event.create!({
  name: "Techno Party, Brace Yourself.",
  description: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium",
  location: "Amsterdam",
  price: 45,
  capacity: 1200,
  includes_food: true,
  includes_drink: true,
  starts_at: 04112017,
  ends_at: 04112017,
  active: true,
  user: sam,
  categories: [music, live_music, fun_and_games]
  })

photo1 = Photo.create!(remote_image_url: "http://res.cloudinary.com/dbe5xk4jk/image/upload/v1507801885/pexels-photo-167605_yhpzsd.jpg", event: event_1)
photo2 = Photo.create!(remote_image_url: "http://res.cloudinary.com/dbe5xk4jk/image/upload/v1507801751/SW_Dylan_2BRives_u9e98u.jpg", event: event_2)
photo3 = Photo.create!(remote_image_url: "http://res.cloudinary.com/dbe5xk4jk/image/upload/v1507801671/pexels-photo-433452_by4i6t.jpg", event: event_3)
