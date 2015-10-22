require 'spec_helper'

describe Rubella::Output::ASCII, '.render' do

  it 'creates an ASCII image from the given data' do
    data    = [
        [0, 0.1, 0.01],
        [0, 0.3, 0.55],
        [1, 0.64, 0.4]
      ]
    storage = Rubella::Storage.new(data)
    output  = Rubella::Output::ASCII.new storage

    # [" ", "·", "⚬", "∞", "@", "#", "░", "▒", "▓", "█"]
    image = " \#@\n"+
            "·∞░\n"+
            "  █"

    expect(output.render).to eq(image)
  end

  it 'creates an ASCII image from the given data using the settet symbols' do
    data    = [
        [0, 0.1, 0.01],
        [0, 0.3, 0.55],
        [1, 0.64, 0.4]
      ]
    storage = Rubella::Storage.new(data)
    output  = Rubella::Output::ASCII.new storage
    output.used_symbols = "numbers"

    # [" ", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    image = " 54\n"+
            "136\n"+
            "  9"

    expect(output.render).to eq(image)
  end

end
