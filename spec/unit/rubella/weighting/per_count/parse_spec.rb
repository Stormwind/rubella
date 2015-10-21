require 'spec_helper'

describe Rubella::Weighting::PerCount, '.parse' do

  it "returns a Rubella::Storage object" do
    input = []
    # input = Rubella::Input::Base.new [] # Does not work atm FIX IT!
    weighting = Rubella::Weighting::PerCount.new

    expect(weighting.parse(input)).to be_instance_of(Rubella::Storage)
  end

  it "splits data in given amount of buckets" do
    input = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
    weighting = Rubella::Weighting::PerCount.new 7

    storage = weighting.parse(input)

    expect(storage.length).to eq(2)
    expect(storage.dataset_length).to eq(7)
  end

  it "gives maximum intensity (1) to the maximum value" do
    input = [1, 2, 1, 3, 1, 4, 10, 2, 1, 2, 3, 4, 2, 1]
    weighting = Rubella::Weighting::PerCount.new 7

    storage = weighting.parse(input)

    expect(storage.data[0][6]).to eq(1.0)
  end

  it "computes the intensity on the maximum value" do
    input = [1, 2, 1, 3, 1, 4, 5, 2, 1, 2, 3, 4, 2, 1]
    weighting = Rubella::Weighting::PerCount.new 7

    storage = weighting.parse(input)

    expect(storage.data).to eq(
      [[0.2, 0.4, 0.2, 0.6, 0.2, 0.8, 1.0], [0.4, 0.2, 0.4, 0.6, 0.8, 0.4, 0.2]]
    )
  end

  it "writes 0 if value is 0" do
    input = [0, 2, 1, 3, 1, 4, 5, 2, 1, 2, 3, 4, 2, 1]
    weighting = Rubella::Weighting::PerCount.new 7

    storage = weighting.parse(input)

    expect(storage.data[0][0]).to eq(0.0)
  end

  it "sets 0 to 0 even if the maximum value is 0" do
    input = [0, 0, 0, 0]
    weighting = Rubella::Weighting::PerCount.new 2
    
    storage = weighting.parse(input)

    expect(storage.data[0][0]).to eq(0.0)
  end

end