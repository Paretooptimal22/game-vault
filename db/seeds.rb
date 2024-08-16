# Clear existing users (optional, if you want to start fresh)
Rental.destroy_all
Listing.destroy_all
User.destroy_all
Game.destroy_all

require 'net/https'
require 'json'
require 'uri'
require 'dotenv/load'

client_id = ENV.fetch('CLIENT_ID')
access_token = ENV.fetch('ACCESS_TOKEN')

# Set up the HTTP connection
http = Net::HTTP.new('api.igdb.com', 443)
http.use_ssl = true

# Define the headers
uri = URI.parse('https://api.igdb.com/v4/games')
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
request = Net::HTTP::Post.new(uri.request_uri)
request['Client-ID'] = "#{client_id}"
request['Authorization'] = "Bearer #{access_token}"
request['Content-Type'] = 'application/json'

# Create the request
request.body = <<-QUERY
  fields name, aggregated_rating, age_ratings.rating, genres.name, platforms.name, websites.url, artworks.url, cover.url,  summary, screenshots.url, storyline, videos.video_id;
  where aggregated_rating > 90;
  limit 50;
QUERY

# Send the request and parse the response
response = http.request(request)
games = JSON.parse(response.body)

# Create Game instances based on the API response
games.each do |game|
  name = game['name']
  age_rating = game['age_ratings']&.first&.dig('rating')&.to_s || "10"
  aggregate_rating = game['aggregated_rating'] || rand(1..10)
  genres = game['genres']&.map { |g| g['name'] }&.join(', ') || Faker::Game.genre
  platforms = game['platforms']&.map { |p| p['name'] }&.join(', ') || Faker::Game.platform
  cover = game['cover'] ? game['cover']['url'].gsub("//", "https://") : "https://i.etsystatic.com/7131434/r/il/f9b9e9/2410353563/il_fullxfull.2410353563_6sw2.jpg"
  website = game['websites']&.first&.dig('url') || Faker::Internet.url
  artworks = game['artworks'] ? game['artworks'][0]['url'].gsub("//", "https://") : "https://i.etsystatic.com/7131434/r/il/f9b9e9/2410353563/il_fullxfull.2410353563_6sw2.jpg"
  screenshots = game['screenshots'] ? game['screenshots'][0]['url'].gsub("//", "https://") : "https://i.etsystatic.com/7131434/r/il/f9b9e9/2410353563/il_fullxfull.2410353563_6sw2.jpg"
  summary = game['summary']
  storyline = game['storyline']

  g = Game.create!(
    name: name,
    age_rating: age_rating,
    aggregate_rating: aggregate_rating,
    genres: genres,
    platforms: platforms,
    cover: cover,
    website: website,
    artworks: artworks,
    screenshots: screenshots,
    summary: summary,
    storyline: storyline
  )
end
# Generate 30 users with Faker
30.times do
  user = User.create!(
    name: Faker::Internet.username(specifier: 5..10),
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 8),
    rating: rand(1..5)
  )

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
    status: Rental.statuses.keys.sample
  )
end

puts "#{Game.count} games have been seeded!"
puts "#{User.count} users have been seeded!"
puts "#{Listing.count} listings have been seeded!"
puts "#{Rental.count} rentals have been seeded!"
