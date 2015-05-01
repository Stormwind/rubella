require 'spec_helper'

describe Rubella::Storage, '.new' do

  it "creates a new Storage" do
    storage = Rubella::Storage.new []

    expect(storage).to be_an_instance_of(Rubella::Storage)
  end

  it "fills the Storage with the given data" do
    storage = Rubella::Storage.new [1, 2, 3]

    expect(storage.data).to eq([1, 2, 3])
  end

  it "disable length feature, if no length is given" do
    storage = Rubella::Storage.new [1, 2, 3]

    expect(storage.length).to eq(3)
    expect(storage.data.length).to eq(3)
  end

  it "disable length feature, if length is 0" do
    storage = Rubella::Storage.new [1, 2, 3], 0

    expect(storage.length).to eq(3)
    expect(storage.data.length).to eq(3)
  end

  it "sets the length" do
    storage = Rubella::Storage.new [1, 2, 3], 2

    expect(storage.length).to eq(2)
  end

  it "uses length feature, if length is given" do
    storage = Rubella::Storage.new [1, 2, 3], 2

    expect(storage.data.length).to eq(2)
  end

end