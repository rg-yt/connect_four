require 'board'

describe Board do
  subject(:board) { described_class.new }
  it 'initalizes' do
    expect(:board).to_not be_nil
  end 
end