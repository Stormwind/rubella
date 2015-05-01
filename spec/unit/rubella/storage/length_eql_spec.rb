require 'spec_helper'

describe Rubella::Storage, '.length=' do

  it "sets the length to the given value" do
    storage = Rubella::Storage.new [3, 4, 5]

    storage.length = 2

    expect(storage.length).to eq(2)
  end

  it "chops the data to the given length" do
    storage = Rubella::Storage.new [3, 4, 5]

    storage.length = 2

    expect(storage.data.length).to eq(2)
  end

  it "disables the length chopping, if its set to 0" do
    storage = Rubella::Storage.new [3, 4, 5]

    storage.length = 0

    expect(storage.data.length).to eq(3)
  end

  it "grows the data to the given length" do
    storage = Rubella::Storage.new [[0, 1], [2, 3], [4, 5]]

    storage.length = 5

    expect(storage.data.length).to eq(5)
  end

  it "grows the data by using the length of the dataset as array length" do
    storage = Rubella::Storage.new [[0, 1], [2, 3], [4, 5]]

    storage.length = 5

    expect(storage.data[0].length).to eq(2)
    expect(storage.data[1].length).to eq(2)
    expect(storage.data[2].length).to eq(2)
    expect(storage.data[3].length).to eq(2)
    expect(storage.data[4].length).to eq(2)
  end

  it "grows the data by using 0 values" do
    storage = Rubella::Storage.new [[0, 1], [2, 3], [4, 5]]

    storage.length = 5

    expect(storage.data[0][0]).to eq(0)
    expect(storage.data[0][1]).to eq(0)
    expect(storage.data[1][0]).to eq(0)
    expect(storage.data[1][1]).to eq(0)
  end

  it "does not grow the data, if Storage is empty" do
    storage = Rubella::Storage.new []

    storage.length = 5

    expect(storage.data.length).to eq(0)
  end

end
