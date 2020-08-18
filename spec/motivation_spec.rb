require_relative '../lib/motivation.rb'

describe Motivation do
  let(:motivation) { Motivation.new }

  describe '.initialize' do
    it 'Check if motivation messages are received' do
      list = motivation.instance_variable_get :@values
      expect(list).not_to be_empty
    end

    it 'Check if motivational messages are different' do
      list = motivation.instance_variable_get :@values
      message_one = list.sample
      message_two = list.sample
      expect(message_one).not_to eq(message_two)
    end
  end
  describe '.random' do
    it 'Selects random messages' do
      new_motivation = Motivation.new
      message_one = motivation.random['text']
      message_two = new_motivation.random['text']
      expect(message_one).not_to eq(message_two)
    end
  end
end
