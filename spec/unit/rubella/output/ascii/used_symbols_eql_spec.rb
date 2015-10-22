require 'spec_helper'

describe Rubella::Output::ASCII, '.used_symbols' do

  it "sets the name of the current set of symbols" do
    output = Rubella::Output::ASCII.new nil
    expect(output.used_symbols).to eq('shades_ascii')

    output.used_symbols= "numbers"
    expect(output.used_symbols).to eq('numbers')
  end

  it "throws an AgrumentError if set is not available" do
    output = Rubella::Output::ASCII.new nil

    expect{ output.used_symbols= "foobar" }.to raise_error(ArgumentError)
  end

end
