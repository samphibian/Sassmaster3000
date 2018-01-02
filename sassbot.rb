require 'discordrb'
require 'json'

file = File.read('config.json')
info_hash = JSON.parse(file)
userArray = []

bot = Discordrb::Commands::CommandBot.new token: info_hash['bot_token'], prefix: '/'

bot.message(with_text: 'ping') do |event|
  puts event
  event.respond 'Pong!'
end

bot.command(:sass) do |event, user|  
  puts event
  # user = event.message.content.split(' ')[1]
  puts user
  userArray.push(user)
  return nil
end

bot.message(from: userArray) do |event|
  event.respond 'plagiarize'
end

bot.run