# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#

require "json"
require "rest-client"

puts "Suppression de tous les posts avant le seed"
Post.all.delete_all

# TODO: Write a seed to insert 10 posts in the database fetched from the Hacker News API.

puts "Recupere les 30 premieres posts"
response = RestClient.get "https://hacker-news.firebaseio.com/v0/topstories.json"
repos = JSON.parse(response).first(30)

puts "Creation des posts dans la db"
repos.each do |n|
  puts "https://hacker-news.firebaseio.com/v0/item/#{n}.json"
  response = RestClient.get "https://hacker-news.firebaseio.com/v0/item/#{n}.json"
  json = JSON.parse(response)
  # puts "#{json}"
  puts "#{json["title"]}"
  Post.create!(title: json["title"],
              post_type: json["type"],
              url: json["url"],
              score: json["score"].to_i,
              by: json["by"])
end

puts "Nous avons crée #{Post.count} posts à partir de l'api hacker news"
