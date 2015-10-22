require 'spec_helper'

describe Rubella::Output::Image, '.render' do

  it "returns a Magick::Image" do
    data    = [
        [0, 0.1, 0.01],
        [0, 0.3, 0.55],
        [1, 0.64, 0.4]
      ]
    storage = Rubella::Storage.new(data)
    output  = Rubella::Output::Image.new storage

    expect(output.render).to be_kind_of(Magick::Image)
  end

  it "creates an image from the given data" do
    data    = [
        [0, 0.1, 0.01],
        [0, 0.3, 0.55],
        [1, 0.64, 0.4]
      ]
    storage = Rubella::Storage.new(data)
    output  = Rubella::Output::Image.new storage, 2

    image = [255, 253, 253, 255, 253, 253, 255, 115, 115, 255, 115, 115, 255,
      153, 153, 255, 153, 153, 255, 253, 253, 255, 253, 253, 255, 115, 115, 255,
      115, 115, 255, 153, 153, 255, 153, 153, 255, 229, 229, 255, 229, 229, 255,
      179, 179, 255, 179, 179, 255, 91, 91, 255, 91, 91, 255, 229, 229, 255,
      229, 229, 255, 179, 179, 255, 179, 179, 255, 91, 91, 255, 91, 91, 255,
      255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 1, 1, 255, 1,
      1, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 1, 1,
      255, 1, 1].pack('C*')

    expect(output.render.export_pixels_to_str).to eq(image)
  end

end
