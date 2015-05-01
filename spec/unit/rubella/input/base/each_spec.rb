require 'spec_helper'

describe Rubella::Input::Base, '.each' do

  it "passes the data through the given block" do
    storage = Rubella::Input::Base.new [3, 4, 5]

    sum = 0
    storage.each do |value|
      sum = sum + value
    end

    expect(sum).to eq(12)
  end

end