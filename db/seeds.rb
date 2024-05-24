# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


require "json"
require "open-uri"

url = "https://tmdb.lewagon.com/movie/top_rated"
user_serialized = URI.open(url).read
user = JSON.parse(user_serialized)

# title = user["results"].first["title"]
# poster_path =user["results"].first["poster_path"]
# rating= user["results"].first["vote_average"]

poster_base = "https://image.tmdb.org/t/p/original"
user["results"].first(20).each do |movie|
  Movie.create(
    title: movie["title"],
    poster_url: poster_base + movie["poster_path"],
    overview: movie["overview"],
    rating:movie["vote_average"])
end


# https://image.tmdb.org/t/p/original/3bhkrj58Vtu7enYsRolD1fZdja1.jpg

# # title = first_50["original_title"]
#   puts element["title"]
#   puts element["poster_path"]
#   puts element["vote_average"]
#   movies_hash{
#     "title" => element["title"];
#   "poster_url"=> element["poster_path"];
#   "rating" => element["vote_average"];
#   }
#   movies_hash{
#     "title" << element["title"];
#   "poster_url"=> element["poster_path"];
#   "rating" => element["vote_average"];
#   }
