require 'spec_helper'

describe Rubella::Storage, '.add' do
  
  it "returns a new Storage with the given Storages data before the old" do
    storage_1 = Rubella::Storage.new [3, 4, 5]
    storage_2 = Rubella::Storage.new [0, 1, 2]

    storage_new = storage_1.add storage_2
    expect(storage_new.data).to eq([0, 1, 2, 3, 4, 5])
  end

  it "uses the length of the first given Storage" do
    storage_1 = Rubella::Storage.new [3, 4, 5, 6, 7], 4
    storage_2 = Rubella::Storage.new [0, 1, 2], 3

    storage_new = storage_1.add storage_2
    expect(storage_new.length).to eq 4
  end

  it "chops the data to the given length" do
    storage_1 = Rubella::Storage.new [3, 4, 5, 6, 7], 4
    storage_2 = Rubella::Storage.new [0, 1, 2], 3

    storage_new = storage_1.add storage_2
    expect(storage_new.data).to eq([0, 1, 2, 3])
  end

end
