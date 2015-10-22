require 'spec_helper'

describe Rubella::Output::Base, '.field_size' do

  it "returns the given field_sitze" do
    output = Rubella::Output::Base.new nil, 5

    expect(output.field_size).to eq(5)
  end

end
