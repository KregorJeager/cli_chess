# frozen_string_literal:false

require_relative '../lib/chess_cop_module'
describe ChessCop do
  subject(:cop) { Class.new { extend ChessCop } }
  let(:board) { Array.new(8) { Array.new(8) { nil } } }

  # A method that calculates all y,x positions that a piece will travel and return
  #  them in an array.
  describe '#get_path_positions' do
    describe 'out of board' do
      xit 'returns nil when curr pos is out of board' do
        curr_pos = [0, 8]
        new_pos = [3, 3]
        output = nil
        expect(cop.get_path_pos(curr_pos, new_pos)).to eq(output)
      end
      xit 'returns nil when new_pos is out of board' do
        curr_pos = [0, 4]
        new_pos = [8, 3]
        output = nil
        expect(cop.get_path_pos(curr_pos, new_pos)).to eq(output)
      end
    end
    describe 'straight movevement' do
      context 'when moving to the right' do
        it 'return an array of y,x positions from left to right' do
          current_position = [1, 1]
          new_postion = [1, 4]
          positions_along_the_way = [[1, 2], [1, 3], [1, 4]]
          expect(cop.get_path_pos(current_position, new_postion))
            .to eq(positions_along_the_way)
        end
      end

      context 'when moving to the left' do
        it 'returns array of positions from right to left' do
          current_position = [6, 6]
          new_postion = [6, 1]
          positions_along_the_way = [[6, 5], [6, 4], [6, 3], [6, 2], [6, 1]]
          expect(cop.get_path_pos(current_position, new_postion))
            .to eq(positions_along_the_way)
        end
      end
      context 'when moving upward' do
        it 'returns array of positions from bottom to top' do
          current_position = [4, 5]
          new_postion = [4, 7]
          positions_along_the_way = [[4, 6], [4, 7]]
          expect(cop.get_path_pos(current_position, new_postion))
            .to eq(positions_along_the_way)
        end
      end

      context 'when moving downward' do
        it 'returns array of positions from top to bottom' do
          current_position = [7, 7]
          new_postion = [7, 4]
          positions_along_the_way = [[7, 6], [7, 5], [7, 4]]
          expect(cop.get_path_pos(current_position, new_postion))
            .to eq(positions_along_the_way)
        end
      end
    end

    describe 'diagonal movement' do
      it 'returns nil when not 45 degree diagonal' do
        curr_pos = [1, 1]
        new_pos = [2, 4]
        expect(cop.get_path_pos(curr_pos, new_pos)).to eq(nil)
      end
      it 'moving diagonally upwards to the left' do
        curr_pos = [7, 5]
        new_pos = [4, 2]
        output = [[6, 4], [5, 3], [4, 2]]
        expect(cop.get_path_pos(curr_pos, new_pos)).to eq(output)
      end
      it 'moving diagonally upward to the right' do
        curr_pos = [7, 2]
        new_pos = [4, 5]
        output = [[6, 3], [5, 4], [4, 5]]
        expect(cop.get_path_pos(curr_pos, new_pos)).to eq(output)
      end
      it 'moving diagonally downward to the left' do
        curr_pos = [0, 4]
        new_pos = [3, 1]
        output = [[1, 3], [2, 2], [3, 1]]
        expect(cop.get_path_pos(curr_pos, new_pos)).to eq(output)
      end
      it 'moving diagonally downward to the right' do
        curr_pos = [0, 0]
        new_pos = [4, 4]
        output = [[1, 1], [2, 2], [3, 3], [4, 4]]
        expect(cop.get_path_pos(curr_pos, new_pos)).to eq(output)
      end
    end
    describe 'horse movement' do
    end
  end
end
