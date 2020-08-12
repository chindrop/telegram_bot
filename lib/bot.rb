require 'telegram/bot'
require_relative 'motivation.rb'

class Bot
  def initialize
    token = ENV['BOT_TOKEN']

    Telegram::Bot::Client.run(token) do |bot|
      bot.listen do |message|
        case message.text
        when '/start'
          bot.api.send_message(chat_id: message.chat.id, text: "Hallo, #{message.from.first_name}")
        when '/stop'
          bot.api.send_message(chat_id: message.chat.id, text: "Ciao, #{message.from.first_name}", date: message.date)
        when '/motivate'
          values = Motivation.new
          value = values.random
          bot.api.send_message(chat_id: message.chat.id, text: (value['text']).to_s, date: message.date)
        else bot.api.send_message(chat_id: message.chat.id, text: "Invalid entry, #{message.from.first_name}, You need to use /start, /stop , /motivate or /joke")
        end
      end
    end
  end
end
