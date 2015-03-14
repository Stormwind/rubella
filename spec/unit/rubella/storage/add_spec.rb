require 'spec_helper'

describe Rubella::Storage, '.add' do
  
  it "returns a new Storage with the given Storages data before the old" do
    storage_1 = Rubella::Storage.new [3, 4, 5]
    storage_2 = Rubella::Storage.new [0, 1, 2]

    storage_new = storage_1.add storage_2
    expect(storage_new.data).to eq([0, 1, 2, 3, 4, 5])
  end

end
