require 'spec_helper'

describe Rubella::Weighting::Base, '.buckets' do  
  
  it "returns the current amount of buckets" do
    weighting = Rubella::Weighting::Base.new 20

    expect(weighting.buckets).to eq(20)
  end

end
