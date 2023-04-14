
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

board.pretty_print
