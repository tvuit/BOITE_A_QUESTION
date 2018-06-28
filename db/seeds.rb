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
puts "importing stories"
page_number = 1
mobile_visit = 0
desktop_visit = 0
date = Time.now.to_i
until date < 1514764800
response = HTTParty.get("https://stream.francetvinfo.fr/stream/contents/taxo/desk/stories.json/page/#{page_number}")
response["contents"].each do |article|
  # fb = HTTParty.get("https://graph.facebook.com/?id=#{article["sharedUrl"]}")["share"]["share_count"]

# id = article["id"]

#   mobile_views = HTTParty.get("https://apirest.atinternet-solutions.com/data/v2/json/getData?&columns={cl_398634,m_visits}&sort={-m_visits}&filter={cl_398630:{$period:%27all%27},cl_436551:{$eq:%272-1%27}}&space={s:573499}&period={R:{D:{start:%27-45%27,end:%27-1%27}}}&max-results=10000&apikey=d8a35ec3-bbf6-4763-861d-340a6d6b99d3")
#   mobile_views["DataFeed"][0]["Rows"].each do |mcontent|
#       if mcontent["cl_398634"] == id
#       mobile_visit = mcontent["m_visits"]
#       end
#     end
# EN PIOCHANT PAR ID  ICI >>>> https://apirest.atinternet-solutions.com/data/v2/json/getData?&columns={cl_398523,m_visits,cl_436555}&sort={-m_visits}&filter={cl_398523:{$eq:'INTERPOLE ICI ID ARTICLE'},cl_436555:{$eq:'2-1'}}&space={s:573502}&period={R:{M:{start:'-10',end:'-1'}}}&max-results=50&page-num=1
#   desktop_views = HTTParty.get("https://apirest.atinternet-solutions.com/data/v2/json/getData?&columns={cl_398523,m_visits}&sort={-m_visits}&filter={cl_398518:{$period:'all'},cl_436555:{$eq:'2-1'}}&space={s:573502}&period={R:{D:{start:'-45',end:'-1'}}}&max-results=1000&apikey=292d367a-d16a-49cd-b568-368412d2c022")
#   desktop_views["DataFeed"][0]["Rows"].each do |vcontent|
#     if vcontent["cl_398523"] == id
#     desktop_visit = vcontent["m_visits"]
#     end
#   end
# unless article["sharedUrl"].include?("blog.francetvinfo.fr")
Story.create!(title: article["title"], description: article["description"], firstPublicationDate: article["firstPublicationDate"], sharedUrl: article["sharedUrl"], media: article["medias"][0]["urlThumbnail"])
# end
  date = article["firstPublicationDate"]
  end
  page_number += 1
end

puts "ok!"


