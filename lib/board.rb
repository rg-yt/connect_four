
class Board
  attr_reader :values

  def initialize(values = Array.new(6) { Array.new(7) })
    @values = values
  end

  def update_board(column, character)
    values.reverse.map.with_index do |row, index|
      if row[column].nil?
        row[column] = character
        return [index, column]
      end
    end
  end

  def end_game?(coordinates, character)
    win_across?(coordinates, character) || win_diagonally?(coordinates, character) || win_up_down?(coordinates, character)
  end

  def win_up_down?(coordinates, character, rows = [0, 1, 2, 3])
    return false if rows.last == 6
    return true if rows.all? { |row| values[row][coordinates.last] == character }

    win_up_down?(coordinates, character, rows.map { |row| row + 1 })
  end

  def win_across?(coordinates, character)
    values.reverse[coordinates.first].join('').include?(character * 4)
  end

  def win_diagonally?(player_input, character)
    
  end

  def pretty_print
    values.each do |row|
      row.each do |token|
        print token.nil? ? "|  #{token} |" : "| #{token} |"
      end
      puts ''
    end
    puts '-----------------------------------'
    7.times { |num| print "| #{num} |" }
    puts ''
    puts '-----------------------------------'
  end
end
board = Board.new
p board.update_board(1, 'x')
p board.update_board(1, 'x')

