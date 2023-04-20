require 'board'

describe Board do
  describe '#update_board' do
    subject(:board) { described_class.new}
    let(:character) { '⚫' }
    let(:player_input) { 1 }
    context 'when row is empty' do
      it 'changes the top of player input coloumn to character' do
        board.update_board(player_input, character)
        expect(board.values[-1][1]).to eq('⚫')
      end

      it 'does not change other characters in the column' do
        board.update_board(player_input, character)
        expect(board.values[-2][1]).to be_nil
      end

      it 'does not change other row' do
        board.update_board(player_input, character)
        values = board.values[-1][0..]
        expect(values).to include('⚫').at_most(:once)
      end
    end

    context 'when another character is no the bottom' do
      it 'changes the top of the stack' do
        board.update_board(player_input, character)
        board.update_board(player_input, character)
        expect(board.values[-2][1]).to eq('⚫')
      end
    end
  end

  describe '#win_up_down?' do
    context 'when board is one away from win' do
      subject(:board) { described_class.new() }  
      before do
        board.instance_variable_set(:@values, [[nil], ['⚫'], ['⚫'], ['⚫'], ['⚪'], ['⚪']])
      end
      it 'is not a win before adding a piece' do
        result = board.win_up_down?([0, 0], '⚫')
        expect(result).to be false
      end

      it 'is a win after adding a player piece' do
        location = board.update_board(0, '⚫')
        result = board.win_up_down?(location, '⚫')
        expect(result).to be true
      end

      it 'is not a win if checked for the other player' do
        result = board.win_up_down?([0, 0], '⚪')
        expect(result).to be false
      end
    end
  end

  describe '#win_across?' do
    subject(:board) { described_class.new }
    context 'on an empty board' do
      it 'is not a win' do
        result = board.win_across?([0, 0], '⚪')
        expect(result).to be false
      end
    end

    context 'on a reduced board' do
      before do
        board.instance_variable_set(:@values, [['⚪', '⚪', '⚪', '⚪'], ['⚪', '⚪', '⚫', '⚪', '⚪', '⚪', '⚪']])
      end

      it 'is a win' do
        result = board.win_across?([0, 0], '⚪')
        expect(result).to be true
      end
    end

    context 'on a full board' do
      subject(:full_board) { described_class.new }
      before do
        full_board.instance_variable_set(:@values, [
          [nil, nil, nil, nil, nil, nil, '⚪'],
          [nil, nil, nil, '⚪', '⚪', nil, '⚪'],
          ['⚫', nil, '⚫', '⚫', '⚪', nil, '⚪'],
          ['⚪', '⚫', '⚫', '⚫', '⚪', '⚪', '⚪'],
          ['⚪', '⚪', '⚫', '⚪', '⚪', '⚪', '⚪'],
          ['⚪', '⚪', '⚫', '⚪', '⚪', '⚪', '⚪']])
      end

      it 'is a win' do
        location = full_board.update_board(1, '⚫')
        result = full_board.win_across?(location, '⚫')
        expect(result).to be true
      end
    end
  end

  describe '#win_diagonally?' do
    subject(:board) { described_class.new }
    before do
      board.instance_variable_set(:@values, [
        ['⚪', '⚫', '⚫', '⚫', '⚫', '⚫', '⚪'],
        ['⚪', '⚪', '⚪', '⚪', '⚪', '⚫', '⚪'],
        ['⚫', '⚪', '⚫', '⚫', '⚪', '⚪', '⚪'],
        ['⚪', '⚫', '⚫', '⚫', '⚪', '⚪', '⚪'],
        ['⚪', '⚪', '⚫', '⚪', '⚪', '⚪', '⚪'],
        ['⚪', '⚪', '⚫', '⚪', '⚪', '⚪', '⚪']])
    end
    it 'is a win' do
      result = board.win_diagonally?([1,5], '⚪')
      expect(result).to be true
    end
  end
end