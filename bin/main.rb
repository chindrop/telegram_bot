# !/usr/bin/env ruby

require 'dotenv/load'

require_relative '../lib/bot.rb'
require_relative '../lib/motivation.rb'

puts 'Enter your token to start the bot, Press ctrl + C to stop the bot'
token_bot = gets.chomp

telegram_bot = Bot.new
telegram_bot.token = token_bot
telegram_bot.telegram
