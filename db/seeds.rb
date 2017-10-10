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

event = Event.create!({
  name: "Party in Centraal!",
  description: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium",
  location: "Amsterdam",
  price: 5,
  capacity: 2000,
  includes_food: true,
  includes_drink: true,
  starts_at: 04112017,
  ends_at: 04112017,
  active: true,
  user: ant,
  categories: [fun_and_games, social_and_drinks]
  })

event = Event.create!({
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

event = Event.create!({
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

event = Event.create!({
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
