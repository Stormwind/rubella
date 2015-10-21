require 'spec_helper'

describe Rubella::Weighting::Exponential, '.parse' do

  it "returns a Rubella::Storage object" do
    input = []
    # input = Rubella::Input::Base.new [] # Does not work atm FIX IT!
    weighting = Rubella::Weighting::Exponential.new

    expect(weighting.parse(input)).to be_instance_of(Rubella::Storage)
  end

  it "splits data in given amount of buckets" do
    input = [[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]]
    weighting = Rubella::Weighting::Exponential.new 5

    storage = weighting.parse(input)

    expect(storage.length).to eq(1)
    expect(storage.dataset_length).to eq(5)
  end

   it "computes the intensity exponential on the number of cores" do
    input = [[10, 20, 10, 30], [20, 40, 20, 20], [40, 40, 40, 40]]
    weighting = Rubella::Weighting::Exponential.new 5

    storage = weighting.parse(input)

    # THINK ABOUT: I'm not sure, if there should be values bigger than 1 ...
    expect(storage.data[0][0]).to be(0.0)
    expect(storage.data[0][1]).to be_between(0.45, 0.55).inclusive
    expect(storage.data[0][2]).to be(0.0)
    expect(storage.data[0][3]).to be(0.0)
    expect(storage.data[0][4]).to be(0.0)

    expect(storage.data[1][0]).to be(0.0)
    expect(storage.data[1][1]).to be >= (1.0)
    expect(storage.data[1][2]).to be >= (1.0)
    expect(storage.data[1][3]).to be(0.0)
    expect(storage.data[1][4]).to be(0.0)

    expect(storage.data[2][0]).to be(0.0)
    expect(storage.data[2][1]).to be(0.0)
    expect(storage.data[2][2]).to be >= (1.0)
    expect(storage.data[2][3]).to be(0.0)
    expect(storage.data[2][4]).to be(0.0)
  end

end
