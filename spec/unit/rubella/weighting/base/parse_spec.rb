require 'spec_helper'

describe Rubella::Weighting::Base, '.parse' do
  
  it "raises NotImplementedError" do
    weighting = Rubella::Weighting::Base.new

    expect{ weighting.parse(nil) }.to raise_error(NotImplementedError)
  end

end
