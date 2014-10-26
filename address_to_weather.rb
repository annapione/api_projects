require 'open-uri'
require 'json'

require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

puts "Let's get the weather forecast for your address."

puts "What is the address you would like to know the weather for?"
the_address = gets.chomp
url_safe_address = URI.encode(the_address)

# Your code goes below.

# Ultimately, we want the following line to work when uncommented:

# puts "The current temperature at #{the_address} is #{the_temperature} degrees."
# puts "The outlook for the next hour is: #{the_hour_outlook}"
# puts "The outlook for the next day is: #{the_day_outlook}"
url_of_data_we_want="https://maps.googleapis.com/maps/api/geocode/json?address=#{url_safe_address}"
raw_data=open(url_of_data_we_want).read
parsed_data=JSON.parse(raw_data)
the_latitude=parsed_data["results"][0]["geometry"]["location"]["lat"]
the_longitude=parsed_data["results"][0]["geometry"]["location"]["lng"]

url="https://api.forecast.io/forecast/16484c55617f48d0737167846e12fcc5/#{the_latitude},#{the_longitude}"
raw_data=open(url).read
parsed_data=JSON.parse(raw_data)
the_temperature=parsed_data["currently"]["temperature"]
the_hour_outlook=parsed_data["minutely"]["summary"]
the_day_outlook=parsed_data["hourly"]["summary"]

puts "The current temperature at #{the_address} is #{the_temperature} degrees."
puts "The outlook for the next hour is: #{the_hour_outlook}"
puts "The outlook for the next day is: #{the_day_outlook}"
