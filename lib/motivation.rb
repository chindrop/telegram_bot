# frozen_string_literal: true

require 'telegram_bot'
require 'net/http'
require 'json'
require_relative 'bot.rb'

class Motivation
  @values = nil

  def initialize
    @values = request
  end

  def request
    url = 'https://type.fit/api/quotes'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    response = JSON.parse(response)
    response
  end

  def random
    @values = @values.sample
    @values
  end
end