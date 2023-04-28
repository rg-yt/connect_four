# frozen_string_literal: true

# Container to place characters and check for winners
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

  def space_available?(column)
    values.any? { |row| row[column].nil? }
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

  def win_diagonally?(coordanates, character)
    diagonal_up(coordanates.first, coordanates.last, character) ||
      diagonal_down(coordanates.first, coordanates.last, character)
  end

  def diagonal_up(row, column, character, array = [])
    return array.join('').include?(character * 4) unless column.between?(0, 7)
    return diagonal_up(row + 1, column - 1, character) if array.empty? && column != 0

    array << (row.between?(0, @values.length) ? @values.reverse.dig(row, column) : nil)
    diagonal_up(row - 1, column + 1, character, array)
  end

  def diagonal_down(row, column, character, array = [])
    return array.join('').include?(character * 4) unless column.between?(0, 7)
    return diagonal_down(row - 1, column - 1, character) if array.empty? && column != 0

    array << (row.between?(0, @values.length) ? @values.reverse.dig(row, column) : nil)
    diagonal_down(row + 1, column + 1, character, array)
  end

  def pretty_print
    values.each do |row|
      row.each do |token|
        print token.nil? ? "|  #{token}  |" : "| #{token} |"
      end
      puts ''
    end
    puts '------------------------------------------'
    7.times { |num| print "|  #{num} |" }
    puts ''
    puts '------------------------------------------'
  end
end
