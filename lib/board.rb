
class Board
  attr_reader :values
  
  def initialize(values = Array.new(6){ Array.new(7)})
    @values = values
  end

  def update_board(player_input, character)
    values.reverse.map do |row|
      return row[player_input] = character if row[player_input].nil?
    end
  end

  def to_s
    values.each { |row| p row }
  end
end
board = Board.new
board.update_board(1,'o')
board.update_board(2,'o')
board.update_board(2,'x')
board.update_board(2,'x')


board.to_s