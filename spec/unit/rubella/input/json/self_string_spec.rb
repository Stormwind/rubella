require 'spec_helper'

describe Rubella::Input::JSON, '#self.string' do
  
  it 'returns a Rubella::Input::JSON object' do
    input = Rubella::Input::JSON.string '[]'

    expect(input).to be_instance_of(Rubella::Input::JSON)
  end

  it "uses the given data" do
    input = Rubella::Input::JSON.string '[1, 2, 3]'

    expect(input.data).to eq([1, 2, 3])
  end

end
