require 'spec_helper'

describe Rubella::Weighting::Base, '.new' do

  it "creates a new Weighting instance" do
    weighting = Rubella::Weighting::Base.new

    expect(weighting).to be_instance_of(Rubella::Weighting::Base)
  end

  it "uses 10 buckets by default" do
    weighting = Rubella::Weighting::Base.new

    expect(weighting.buckets).to eq(10)
  end

  it "uses the given number of buckets" do
    weighting = Rubella::Weighting::Base.new 5

    expect(weighting.buckets).to eq(5)
  end
  
end
