require 'board'

describe Board do
  describe '#update_board' do
    let(:bottom_row) { ['o', nil, 'o', 'o', 'o', 'o', 'o'] }
    let(:top_row) { Array.new(6) { Array.new(6) } }
    subject(:board) { described_class.new(top_row << bottom_row) }
    it 'changes the bottom character in the column to player input' do
      player_input = 1
      character = 'O'
      expect { board.update_board(player_input, character) }.to change { board.values[-1][1] }.to(character)
    end

    context 'when another character is no the bottom' do
      let(:character) { 'o' }
      let(:player_input) { 2 }
      before do
        board.update_board(player_input, character) # add one 'o' to column 1
      end
      it 'changes the top of the stack' do
        expected_change = board.values[-2][player_input]
        expect(expected_change).to eq(character)
      end
    end
  end
end