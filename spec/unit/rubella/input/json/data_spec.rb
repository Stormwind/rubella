require 'spec_helper'

describe Rubella::Input::JSON, '.data' do

  it "returns the stored data" do
    input = Rubella::Input::JSON.string "[3, 4, 5]"

    expect(input.data).to eq([3, 4, 5])
  end

end
