require "rubella/output/base"
require 'RMagick'

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
      # @param field_size int How many pixel one value has
      # @return Rubella::Output::Image
      #
      def initialize field_size = 15
        super field_size
      end

      # Creates a pixel based graphic from the given storage data.
      #
      # @param storage Rubella::Storage
      # @return Rubella::Output::Image
      #
      def create storage
        buckets = storage.data[0].length
        columns = storage.data.length

        # image size
        x = columns*@field_size
        y = buckets*@field_size

        # start drawing the damn thing
        @data = Magick::Image.new(x, y) { self.background_color = "white" }

        i = 0
        storage.data.each do |point|
          j = 0
          point.reverse.each do |part|
            # draw a red rectangle on the white background
            core = Magick::Draw.new

            idensity = 127.5 * part
            # Fix for float stupidity
            idensity = 127.5 if idensity > 127.5

            # Get the correct value
            l = (255-idensity).round

            # Draw
            core.fill(Magick::Pixel.from_hsla(0, 255, l, 1).to_color)
            core.rectangle((i*@field_size), (j*@field_size), ((i+1)*@field_size), ((j+1)*@field_size))
            core.draw @data
            j = j + 1
          end
          i = i + 1
        end

        self
      end


    end

  end
end
