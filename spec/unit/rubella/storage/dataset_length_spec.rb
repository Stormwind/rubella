require 'spec_helper'

describe Rubella::Storage, '.dataset_length' do

  it "returns 0 if Storage is empty" do
    storage = Rubella::Storage.new []

    expect(storage.dataset_length).to eq(0)
  end

  it "returns 1 if Storage holds one dimensional array" do
    storage = Rubella::Storage.new [1, 2, 3]

    expect(storage.dataset_length).to eq(1)
  end

  it "returns 1 if Storage datasets have a length of 1" do
    storage = Rubella::Storage.new [[1], [2], [3]]

    expect(storage.dataset_length).to eq(1)
  end

  it "returns the length of the datasets" do
    storage = Rubella::Storage.new [[1, 2], [3, 4], [5, 6]]

    expect(storage.dataset_length).to eq(2)
  end

end
