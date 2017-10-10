User.destroy_all

ant = User.create!({email: "ant@gmail.com", password: "abc123456"})

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
  user: ant
  })
