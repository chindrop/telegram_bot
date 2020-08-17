require_relative '../lib/bot.rb'

describe Bot do
  let(:bot) { Bot.new }
  let(:api_key) { '1153728796:AAFOF8Abq6OPTu2I35xkr2FhlhgzpiylDJw' }
  describe '.initialize' do
    it 'Checks user token recieved' do
      bot.token = api_key
      expect(bot.token).to eq(bot.instance_variable_get(:@token))
    end

    it 'Checks token at start and at end' do
      token_start = bot.token
      bot.token = api_key
      token_end = bot.token
      expect(token_start).to_not eq(token_end)
    end
  end

  # describe '.telegram' do
  #   it 'Returns motivational message' do
  #     bot.token = api_key
  #     result = bot.telegram
  #     expect(result).should be_a(String)
  #   end

  # end
end
