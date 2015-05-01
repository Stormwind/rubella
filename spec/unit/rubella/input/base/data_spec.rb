require 'spec_helper'

describe Rubella::Input::Base, '.data' do

  it "retuns the stored data" do
    input = Rubella::Input::Base.new [3, 4, 5]

    expect(input.data).to eq([3, 4, 5])
  end

end