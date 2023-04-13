require 'board'

describe Board do
  subject(:board) {described_class.new()}
  describe '#update_board' do
    it 'changes the bottom character in the column to player input' do
      player_input = 1
      character = 'O'
      expect{ board.update_board(player_input, character) }.to change{ board.values[5][1] }.to(character)
    end

    context 'when sent multiple characters' do
      let(:character) {'o'}
      let(:player_input) {1}
      before do
        player_input = 1
        board.update_board(player_input,character) # add one 'o' to column 1
         # add second 'o' to column 1
      end
      it 'changes the top of the stack' do
        result = board.update_board(player_input,character)
        expect(result).to eq(character)
      end 
      it 'changes'
    end
  end
end