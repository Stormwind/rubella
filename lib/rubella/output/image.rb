require "rubella/output/base"
require 'rmagick'

module Rubella
  module Output

    # Creates a pixel based graphic as representation of the given storage
    # data using ImageMagick.
    # By the RMagick extention. @data will contain a Magick image for futher
    # handling the data please read the RMagick library documentation:
    # http://www.imagemagick.org/RMagick/doc/
    #
    class Image < Base

      # Constructor
      # Has a default field_size of 15 pixel.
      #
      # @param data Rubella::Storage
      # @param field_size int How many pixel one value has
      # @return Rubella::Output::Image
      #
      def initialize data, field_size = 15
        super data, field_size
      end

      # Creates a pixel based graphic.
      #
      # @return RMagick::Image
      #
      def render
        # image size
        x = @data.length*@field_size         # columns x field_size
        y = @data.dataset_length*@field_size # buckets x field_size

        # start drawing the damn thing
        image = Magick::Image.new(x, y) { self.background_color = "white" }

        i = 0
        @data.each do |point|
          j = 0
          point.reverse.each do |part|
            # draw a red rectangle on the white background
            core = Magick::Draw.new

            intensity = 127.5 * part
            # Fix for float stupidity
            intensity = 127.5 if intensity > 127.5

            # Get the correct value
            l = (255-intensity).round

            # Draw
            core.fill(Magick::Pixel.from_hsla(0, 255, l, 1).to_color)
            core.rectangle((i*@field_size), (j*@field_size), ((i+1)*@field_size), ((j+1)*@field_size))
            core.draw image
            j = j + 1
          end
          i = i + 1
        end

        image
      end


    end

  end
end
