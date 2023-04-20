require 'player'
describe Player do
  subject(:player) { described_class.new(1)}
  it 'has a character value' do
    value = '⚫'
    player_value = player.char
    expect(player.char).to eq(value)
  end

  it 'cannot be changed' do
    expect{player.char = 10}.to raise_error(NoMethodError)
  end 
end