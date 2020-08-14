# !/usr/bin/env ruby

require 'dotenv/load'

require_relative '../lib/bot.rb'
require_relative '../lib/motivation.rb'

telegram_bot = Bot.new

telegram_bot.telegram
