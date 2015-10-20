require 'spec_helper'

describe Rubella::Weighting::PerCount, '.new' do

  it "creates a new Weighting instance" do
    weighting = Rubella::Weighting::PerCount.new

    expect(weighting).to be_instance_of(Rubella::Weighting::PerCount)
  end

  it "uses 7 buckets by default" do
    weighting = Rubella::Weighting::PerCount.new

    expect(weighting.buckets).to eq(7)
  end

  it "uses the given number of buckets" do
    weighting = Rubella::Weighting::PerCount.new 5

    expect(weighting.buckets).to eq(5)
  end
end
