require 'spec_helper'

describe Rubella::Output::ASCII, '.used_symbols' do

  it "returns the name of the current set of symbols" do
    output = Rubella::Output::ASCII.new nil

    expect(output.used_symbols).to eq('shades_ascii')
  end

end
