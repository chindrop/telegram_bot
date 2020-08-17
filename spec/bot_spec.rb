require_relative '../lib/bot.rb'

describe Bot do
let(:bot) {Bot.new}

  describe '.initialize' do
    it 'Checks user token recieved' do
      bot.token = '1154728296:AAFOF8Abq9OPTu2I35xkr2FhlhgzgiylDJw'
      expect(bot.token).to eq(bot.instance_variable_get(:@token))
    end

    it 'Checks token at start and at end' do
      token_start = bot.token
      bot.token = '1154728296:AAFOF8Abq9OPTu2I35xkr2FhlhgzgiylDJw'
      token_end = bot.token
      expect(token_start).to_not eq(token_end)
    end
  end
  describe '.telegram' do
    it 'Check if bot receives message' do
      bot.token = ''
      p bot.telegram
    end
  end
end