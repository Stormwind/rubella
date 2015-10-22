require 'spec_helper'

describe Rubella::Output::Base, '.field_size' do

  it "returns the given field_sitze" do
    output = Rubella::Output::Base.new nil, 0
    expect(output.field_size).to eq(0)

    output.field_size = 5
    expect(output.field_size).to eq(5)
  end

end
