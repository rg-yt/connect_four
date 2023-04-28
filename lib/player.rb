class Player
  attr_reader :char
  
  def initialize(player_number)
    @player_number = player_number
    @char = get_char(player_number)
  end

  def get_char(player_number)
    if player_number == 1
      '⚫'
    else
      '⚪'
    end
  end
end