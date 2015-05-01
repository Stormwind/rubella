require 'spec_helper'

describe Rubella::Input::JSON, '.each' do

  it "passes the data through the given block" do
    input = Rubella::Input::JSON.string "[3, 4, 5]"

    sum = 0
    input.each do |value|
      sum = sum + value
    end

    expect(sum).to eq(12)
  end

end