require 'spec_helper'

describe Rubella::Weighting::PerValue, '.parse' do

  it "returns a Rubella::Storage object" do
    input = []
    # input = Rubella::Input::Base.new [] # Does not work atm FIX IT!
    weighting = Rubella::Weighting::PerValue.new

    expect(weighting.parse(input)).to be_instance_of(Rubella::Storage)
  end

  it "splits data in given amount of buckets" do
    input = [[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]]
    weighting = Rubella::Weighting::PerValue.new 5

    storage = weighting.parse(input)

    expect(storage.length).to eq(1)
    expect(storage.dataset_length).to eq(5)
  end

  it "gives maximum intensity, if all cores have the same load" do
    input = [[10, 20, 10, 30], [10, 40, 10, 20], [40, 40, 40, 40]]
    weighting = Rubella::Weighting::PerValue.new 10

    storage = weighting.parse(input)

    expect(storage.data[2][4]).to eq(1.0)
   end

   it "computes the intensity on the number of cores" do
    input = [[10, 20, 10, 30], [20, 40, 20, 20], [40, 40, 40, 40]]
    weighting = Rubella::Weighting::PerValue.new 10

    storage = weighting.parse(input)

    expect(storage.data).to eq(
      [
        [0.0, 0.5, 0.25, 0.25, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
        [0.0, 0.0, 0.75, 0.0, 0.25, 0.0, 0.0, 0.0, 0.0, 0.0],
        [0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0]
      ]
    )
  end

end
