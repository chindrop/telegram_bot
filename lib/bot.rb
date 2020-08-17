# !/usr/bin/env ruby

require 'telegram/bot'
require 'dotenv/load'
require_relative 'motivation.rb'

# class Motivation
class Bot
  attr_accessor :token

  def initialize
    @token = token
  end

  # rubocop:disable Metrics/MethodLength Metrics/AbcSize
  def telegram
    result = ' '

    bot = TelegramBot.new(token: @token)
    bot.get_updates(fail_silently: true) do |message|
      puts "@#{message.from.username}: #{message.text}"
      command = message.get_command_for(bot)
      message.reply do |reply|
        case command
        when /start/i
          reply.text = "Hello, #{message.from.first_name}!"
        when /stop/i
          reply.text = "Ciao, #{message.from.first_name}"
        when /motivate/i
          values = Motivation.new
          value = values.random
         result = (reply.text = value['text'].to_s)
        else
          reply.text = "#{message.from.first_name}, have no idea what #{command.inspect} means."
        end
        puts "sending #{reply.text.inspect} to @#{message.from.username}"
        reply.send_with(bot)
      end
      result
    end
  end
  # rubocop:enable Metrics/MethodLength
end
