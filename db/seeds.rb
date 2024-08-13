# Clear existing users (optional, if you want to start fresh)
Rental.destroy_all
Listing.destroy_all
User.destroy_all
Game.destroy_all

20.times do
game = Game.create!(
  name: Faker::Game.title,
  age_rating: ["E", "KA", "T", "M"].sample,
  aggregate_rating: rand(1..10),
  genres: Faker::Game.genre,
  platforms: Faker::Game.platform,
  cover: "https://i.etsystatic.com/7131434/r/il/f9b9e9/2410353563/il_fullxfull.2410353563_6sw2.jpg",
  website: Faker::Internet.url
)
end
# Generate 10 users with Faker
10.times do
  user = User.create!(
    name: Faker::Internet.username(specifier: 5..10),
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 8),
    rating: rand(1..5)
  )

  5.times do
  listing = Listing.create!(
    user: user,
    game: Game.all.sample,
    price: rand(5.0..80.0)
  )

  rental = Rental.create!(
    user: user,
    listing: listing,
    start_date: rand(1..5).week.ago,
    end_date: rand(1..5).week.from_now,
    status: [true, false].sample
  )
end
end

puts "10 users with usernames and passwords have been seeded!"
