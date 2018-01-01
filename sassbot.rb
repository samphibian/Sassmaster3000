require 'discordrb'
require 'json'

file = File.read('config.json')
info_hash = JSON.parse(file)

bot = Discordrb::Bot.new token: info_hash['bot_token']

bot.message(with_text: 'Ping!') do |event|
  event.respond 'Pong!'
end

bot.run