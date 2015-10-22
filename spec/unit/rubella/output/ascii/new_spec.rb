require 'spec_helper'

describe Rubella::Output::ASCII, '.new' do

  it "creates a new Rubella::Output::ASCII" do
    output = Rubella::Output::ASCII.new nil

    expect(output).to be_kind_of(Rubella::Output::ASCII)
  end

  it "uses the given data" do
    output = Rubella::Output::AsciiImplementation.new Rubella::Storage.new([]), nil

    expect(output.data).to be_kind_of(Rubella::Storage)
    expect(output.data.data).to eq([])
  end

  it "uses the given field_size" do
    output = Rubella::Output::Base.new nil, 5

    expect(output.field_size).to eq(5)
  end

  it "sets the field_size by default to 1" do
    output = Rubella::Output::ASCII.new nil

    expect(output.field_size).to eq(1)
  end

  it "sets a set of basic symbols" do
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

  it "uses the 'shades_ascii' set by default" do
    output = Rubella::Output::ASCII.new nil

    expect(output.used_symbols).to eq('shades_ascii')
  end

end

class Rubella::Output::AsciiImplementation < Rubella::Output::Base
  attr_reader :data
end
