# frozen_string_literal:false

require_relative '../lib/chess_cop_module'
describe ChessCop do
  subject(:cop) { Class.new { include ChessCop } }
  let(:board) { Array.new(8) { Array.new(8) { nil } } }

  # A method that calculates all y,x positions that a piece will travel and return
  #  them in an array.
  describe '#get_path_positions' do
    describe 'straight movevement' do
      context 'when moving to the right' do
        it 'return an array of y,x positions from left to right' do
          current_position = [1, 1]
          new_postion = [1, 4]
          positions_along_the_way = [[1, 2], [1, 3]]
          expect(cop.get_path_pos(current_position, new_postion))
            .to eq(positions_along_the_way)
        end
      end

      context 'when moving to the left' do
        xit 'returns array of positions from right to left' do
          current_position = [6, 6]
          new_postion = [6, 1]
          positions_along_the_way = [[6, 5], [6, 4], [6, 3], [6, 2]]
          expect(cop.get_path_pos(current_position, new_postion))
            .to eq(positions_along_the_way)
        end
      end
      context 'when moving upward' do
        xit 'returns array of positions from bottom to top' do
          current_position = [4, 5]
          new_postion = [4, 8]
          positions_along_the_way = [[4, 6], [4, 7]]
          expect(cop.get_path_pos(current_position, new_postion))
            .to eq(positions_along_the_way)
        end
      end

      context 'when moving downward' do
        xit 'returns array of positions from top to bottom' do
          current_position = [7, 7]
          new_postion = [7, 4]
          positions_along_the_way = [[7, 6], [7, 5]]
          expect(cop.get_path_pos(current_position, new_postion))
            .to eq(positions_along_the_way)
        end
      end
    end
  end
end
