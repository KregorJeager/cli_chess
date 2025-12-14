# frozen_string_literal: false

require_relative '../lib/chess_pieces'

describe Pawn do
  describe '#available_steps' do
    context 'when pawn is white' do
      subject(:white_pawn) { described_class.new('white') }
      context 'when pawn has not moved yet' do
        it 'can move two steps forward' do
          expect(white_pawn.available_steps([6, 2])).to eq([[5, 2], [4, 2]])
        end
      end
      context 'when pawn already moved out of default position' do
        it 'can move 1 step forward' do
          expect(white_pawn.available_steps([4, 1])).to eq([[3, 1]])
        end
      end
      context 'when next step is outside of board' do
        it 'returns nil' do
          expect(white_pawn.available_steps([0, 4])).to be_nil
        end
      end
    end

    context 'when pawn is black' do
      subject(:black_pawn) { described_class.new('black') }
      context 'when pawn has not moved yet' do
        it 'can move two steps forward' do
          expect(black_pawn.available_steps([1, 2])).to eq([[2, 2], [3, 2]])
        end
      end
      context 'when pawn already moved out of default position' do
        it 'can move 1 step forward' do
          expect(black_pawn.available_steps([3, 2])).to eq([[4, 2]])
        end
      end
      context 'when next step is outside of board' do
        it 'returns nil' do
          expect(black_pawn.available_steps([7, 3])).to be_nil
        end
      end
    end
  end
end
