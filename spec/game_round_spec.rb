# frozen_string_literal: false

require './lib/game_round'

describe GameRound do
  describe '#filter_input' do
    subject(:game) { described_class.new }
    context 'types of input' do
      it 'returns formated array when given postions' do
        expect(game.filter_input('1,1|1,5')).to eq([[1, 1], [1, 5]])
      end
      it 'return string when input does not match a coordinate' do
        expect(game.filter_input('save')).to eq('save')
      end
    end

    describe '#make_move' do
    end
  end
end
