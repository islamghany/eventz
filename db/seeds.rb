# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Event.create!([
  { name: "Kata Camp", location: "Remote", price: 0, starts_at: "2024-06-10 12:00:00", description: "A day of kata practice" },
  { name: "Code & Coffee", location: "Remote", price: 10.0, starts_at: "2024-06-11 08:00:00", description: "Start your day with code and coffee" },
  { name: "RailsConf", location: "Portland, OR", price: 100, starts_at: "2024-06-12 00:00:00", description: "The largest official gathering of Ruby on Rails developers" },
  { name: "Ruby Hack Night", location: "Remote", price: 0, starts_at: "2024-06-13 18:00:00", description: "Hacking on Ruby projects" },
  { name: "Ruby Users Group", location: "Remote", price: 20.0, starts_at: "2024-06-14 18:00:00", description: %{
    Monthly gathering of Ruby enthusiasts.
  }.squish },
])
