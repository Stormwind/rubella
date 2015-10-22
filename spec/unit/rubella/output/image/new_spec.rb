require 'spec_helper'

describe Rubella::Output::Image, '.new' do

  it "creates a new Rubella::Output::Image" do
    output = Rubella::Output::Image.new nil

    expect(output).to be_kind_of(Rubella::Output::Image)
  end

  it "uses the given data" do
    output = Rubella::Output::ImageImplementation.new Rubella::Storage.new([])

    expect(output.data).to be_kind_of(Rubella::Storage)
    expect(output.data.data).to eq([])
  end

  it "uses the given field_size" do
    output = Rubella::Output::Image.new nil, 5

    expect(output.field_size).to eq(5)
  end

  it "uses 15 as default field_size" do
    output = Rubella::Output::Image.new nil

    expect(output.field_size).to eq(15)
  end

end

class Rubella::Output::ImageImplementation < Rubella::Output::Image
  attr_reader :data
end
