# frozen_string_literal: true

require_relative 'player'
require_relative 'board'

class Game
  attr_reader :board

  def initialize
    @players = [Player.new(1), Player.new(2)]
    @board = Board.new
    @coords = [0, 0]
  end

  def play
    loop do
      introduction
      @coords = board.update_board(player_choice, current_player.char)
      break if game_over?

      switch_player!
    end
    outro
  end

  def introduction
    puts `clear`
    puts 'Let\'s play connect four!'
  end

  def current_player
    @players.first
  end

  def game_over?
    board.end_game?(@coords, current_player.char)
  end

  def outro
    puts `clear`
    board.pretty_print
    puts " #{current_player.char} wins!"
  end

  def switch_player!
    @players.rotate!(1)
  end

  def player_choice
    loop do
      board.pretty_print
      print "#{current_player.char} enter a number:"
      column = gets.chomp.to_i
      return column if column.between?(0, 6) && board.space_available?(column)

      puts `clear`
      puts 'Invalid choice please pick again'
    end
  end
end
