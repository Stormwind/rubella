require 'spec_helper'

describe Rubella::Input::Base, '.new' do

  it "creates a new Input instance" do
    input = Rubella::Input::Base.new nil

    expect(input).to be_instance_of(Rubella::Input::Base)
  end

  it "uses the given data" do
    input = Rubella::Input::Base.new 54

    expect(input.data).to eq(54)
  end

end