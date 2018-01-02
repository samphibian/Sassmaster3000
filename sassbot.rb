require 'discordrb'
require 'json'

file = File.read('config.json')
info_hash = JSON.parse(file)
userArray = []
userHashArray = []

bot = Discordrb::Commands::CommandBot.new token: info_hash['bot_token'], prefix: '/'

bot.message(with_text: 'ping') do |event|
  puts event
  event.respond 'Pong!'
end

bot.command(:sass) do |event, mention|
  user = bot.parse_mention(mention)

  unless userArray.include? user
    userArray.push(user)
    userHashArray.push(Hash(user => 5))
  end

  return nil
end

bot.message(from: userArray) do |event|
  puts event.author
  event.respond "plagiarize @#{event.author.name}"
end

bot.run