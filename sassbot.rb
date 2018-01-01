require 'discordrb'

bot = Discordrb::Bot.new token: '<token here>', client_id: 397524031235948545

bot.message(with_text: 'Ping!') do |event|
  event.respond 'Pong!'
end

bot.run