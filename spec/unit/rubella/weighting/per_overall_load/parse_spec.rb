require 'spec_helper'

describe Rubella::Weighting::PerOverallLoad, '.parse' do

  it "returns a Rubella::Storage object" do
    input = []
    # input = Rubella::Input::Base.new [] # Does not work atm FIX IT!
    weighting = Rubella::Weighting::PerOverallLoad.new

    expect(weighting.parse(input)).to be_instance_of(Rubella::Storage)
  end

  it "splits data in given amount of buckets" do
    input = [[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]]
    weighting = Rubella::Weighting::PerOverallLoad.new 5

    storage = weighting.parse(input)

    expect(storage.length).to eq(1)
    expect(storage.dataset_length).to eq(5)
  end

  it "computes the intensity on the number of cores" do
    input = [[10, 20, 10, 30], [20, 40, 20, 20], [40, 40, 40, 40]]
    weighting = Rubella::Weighting::PerOverallLoad.new 5

    storage = weighting.parse(input)

    expect(storage.data[0][0]).to be_within(0.03).of(0.28)
    expect(storage.data[0][1]).to be_within(0.03).of(0.70)
    expect(storage.data[0][2]).to be(0.0)
    expect(storage.data[0][3]).to be(0.0)
    expect(storage.data[0][4]).to be(0.0)

    expect(storage.data[1][0]).to be(0.0)
    expect(storage.data[1][1]).to be_within(0.03).of(0.6)
    expect(storage.data[1][2]).to be_within(0.03).of(0.4)
    expect(storage.data[1][3]).to be(0.0)
    expect(storage.data[1][4]).to be(0.0)

    expect(storage.data[2][0]).to be(0.0)
    expect(storage.data[2][1]).to be(0.0)
    expect(storage.data[2][2]).to be(1.0)
    expect(storage.data[2][3]).to be(0.0)
    expect(storage.data[2][4]).to be(0.0)
  end

end
