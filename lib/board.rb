
class Board
  attr_reader :values

  def initialize(values = Array.new(6) { Array.new(7) })
    @values = values
  end

  def update_board(player_input, character)
    values.reverse.map do |row|
      return row[player_input] = character if row[player_input].nil?
    end
  end

  def end_game?(player_input, character)
    win_across?(player_input, character) || win_diagonally?(player_input, character) || win_up_down?(player_input, character)
  end

  def win_up_down?(player_input, character, rows = [0, 1, 2, 3])
    return false if rows.last == 6
    return true if rows.all? { |row| values[row][player_input] == character }

    win_up_down?(player_input, character, rows.map { |row| row + 1 })
  end

  def win_across?(player_input, character)
    values.any? do |row|
      row.join('').include?(character * 4) unless row[player_input].nil?
    end
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
# board = Board.new
# p board.values
# board.pretty_print
