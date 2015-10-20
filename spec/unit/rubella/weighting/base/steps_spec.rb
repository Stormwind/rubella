require 'spec_helper'

describe Rubella::Weighting::Base, '@steps' do

  it "is always buckets/100" do
    weighting = Rubella::Weighting::Implementation.new

    weighting.buckets = 20
    expect(weighting.steps).to eq(5)

    weighting.buckets = 10
    expect(weighting.steps).to eq(10)
  end
  
end

class Rubella::Weighting::Implementation < Rubella::Weighting::Base
  attr_reader :steps
end
