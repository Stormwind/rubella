require 'spec_helper'

describe Rubella::Output::Base, '.new' do

  it "creates a new Rubella::Output" do
    output = Rubella::Output::Base.new nil, nil

    expect(output).to be_kind_of(Rubella::Output::Base)
  end

  it "uses the given data" do
    output = Rubella::Output::Implementation.new Rubella::Storage.new([]), nil

    expect(output.data).to be_kind_of(Rubella::Storage)
    expect(output.data.data).to eq([])
  end

  it "uses the given field_size" do
    output = Rubella::Output::Base.new nil, 5

    expect(output.field_size).to eq(5)
  end

end

class Rubella::Output::Implementation < Rubella::Output::Base
  attr_reader :data
end
