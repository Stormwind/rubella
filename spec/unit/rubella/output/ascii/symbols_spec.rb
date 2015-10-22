require 'spec_helper'

describe Rubella::Output::ASCII, '.symbols' do

  it "returns the set of symbols" do
    output = Rubella::Output::ASCII.new nil

    symbols = Hash.new
      symbols["shades"]       = 
        [" ", " ", "░", "░", "▒", "▒", "▓", "▓", "█", "█"]
      symbols["shades_ascii"] =
        [" ", "·", "⚬", "∞", "@", "#", "░", "▒", "▓", "█"]
      symbols["ascii"]        =
        [" ", "·", ",", ";", "o", "O", "%", "8", "@", "#"]
      symbols["numbers"]      =
        [" ", "1", "2", "3", "4", "5", "6", "7", "8", "9"]

    expect(output.symbols).to eq(symbols)
  end

end
