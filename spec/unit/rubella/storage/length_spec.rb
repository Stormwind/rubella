require 'spec_helper'

describe Rubella::Storage, '.length' do

  it "returns the current length" do
    storage = Rubella::Storage.new [3, 4, 5]

    expect(storage.length).to eq 3
  end

end