require 'spec_helper'

describe Rubella::Storage, '.data' do

  it "retuns the stored data" do
    storage = Rubella::Storage.new [3, 4, 5]

    expect(storage.data).to eq([3, 4, 5])
  end

end