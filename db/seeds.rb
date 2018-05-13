# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "cleaning dB"

Story.destroy_all

require 'httparty'
puts "impoting stories"
page_number = 1
date = Time.now.to_i
until date < 1514764800
response = HTTParty.get("https://stream.francetvinfo.fr/stream/contents/taxo/desk/stories.json/page/#{page_number}")
response["contents"].each do |article|
Story.create!(title: article["title"], description: article["description"], firstPublicationDate: article["firstPublicationDate"], sharedUrl: article["sharedUrl"], media: article["medias"][0]["urlThumbnail"])
  date = article["firstPublicationDate"]
  end
  page_number += 1
end

puts "ok!"
