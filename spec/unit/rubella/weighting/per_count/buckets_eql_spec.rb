require 'spec_helper'

describe Rubella::Weighting::PerCount, '.buckets=' do

  it "uses the given value" do
    weighting = Rubella::Weighting::PerCount.new

    weighting.buckets = 5

    expect(weighting.buckets).to eq(5)
  end

  it "accepts every given value" do
    weighting = Rubella::Weighting::PerCount.new

    amount = rand(100)
    weighting.buckets = amount

    expect(weighting.buckets).to eq(amount)
  end

end
