require 'spec_helper'

describe Rubella::Output::Base, '.render' do
  
  it "raises NotImplementedError" do
    output = Rubella::Output::Base.new nil, nil

    expect{ output.render }.to raise_error(NotImplementedError)
  end

end
