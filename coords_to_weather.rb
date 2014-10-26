require 'open-uri'
require 'json'

require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

puts "Let's get the weather forecast for your location."

puts "What is the latitude?"
the_latitude = gets.chomp

puts "What is the longitude?"
the_longitude = gets.chomp

# Your code goes below. Use the same approach as you did in
#   address_to_coords.rb to read from a remote API and parse
#   the results.
# Ultimately, we want the following line to work when uncommented:

# puts "The current temperature at #{the_latitude}, #{the_longitude} is #{the_temperature} degrees."
# puts "The outlook for the next hour is: #{the_hour_outlook}"
# puts "The outlook for the next day is: #{the_day_outlook}"

url="https://api.forecast.io/forecast/16484c55617f48d0737167846e12fcc5/#{the_latitude},#{the_longitude}"
raw_data=open(url).read
parsed_data=JSON.parse(raw_data)
the_temperature=parsed_data["currently"]["temperature"]
the_hour_outlook=parsed_data["minutely"]["summary"]
the_day_outlook=parsed_data["hourly"]["summary"]

puts "The current temperature at #{the_latitude}, #{the_longitude} is #{the_temperature} degrees."
puts "The outlook for the next hour is: #{the_hour_outlook}"
puts "The outlook for the next day is: #{the_day_outlook}"




