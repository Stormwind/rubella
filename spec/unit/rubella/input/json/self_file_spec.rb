require 'spec_helper'

describe Rubella::Input::JSON, '#self.file' do
  
  it 'returns a Rubella::Input::JSON object' do
    input = Rubella::Input::JSON.file 'spec/fixtures/json/test_01.json'

    expect(input).to be_instance_of(Rubella::Input::JSON)
  end

  it "uses the given data" do
    input = Rubella::Input::JSON.file 'spec/fixtures/json/test_01.json'

    expect(input.data).to eq([1, 2, 3])
  end

end
