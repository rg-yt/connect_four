require 'game'
describe Game do
  describe '#initialize' do
    subject(:game) { described_class.new }
    it 'has two players' do
      players = game.instance_variable_get(:@players)
      expect(players).to include(Player,Player)
    end

    it 'has a board' do
      board = game.instance_variable_get(:@board)
      expect(board).to be_a Board
    end
  end
end