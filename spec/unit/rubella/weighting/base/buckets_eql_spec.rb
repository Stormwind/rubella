require 'spec_helper'

describe Rubella::Weighting::Base, '.buckets=' do

  it "uses the given value" do
    weighting = Rubella::Weighting::Base.new

    weighting.buckets = 5

    expect(weighting.buckets).to eq(5)
  end

  it "accepts one of 1, 2, 5, 10, 20, 50" do
    weighting = Rubella::Weighting::Base.new

    [1, 2, 5, 10, 20, 50].each do |amount|
      weighting.buckets = amount
      expect(weighting.buckets).to eq(amount)
    end
  end

  it "throws an ArgumentError if the value is not 1, 2, 5, 10, 20, 50" do
    weighting = Rubella::Weighting::Base.new

    expect{ weighting.buckets = 7 }.to raise_error(ArgumentError)
  end

end
