require 'discordrb'
require 'json'

file = File.read('config.json')
info_hash = JSON.parse(file)

bot = Discordrb::Bot.new token: info_hash['token'], client_id: 397524031235948545

bot.message(with_text: 'Ping!') do |event|
  event.respond 'Pong!'
end

puts "This bot's invite URL is #{bot.invite_url}."

bot.run