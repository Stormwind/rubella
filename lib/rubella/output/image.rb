require 'RMagick'

module Rubella
  module Output

    class Image
      attr_accessor :field_size

      def initialize field_size = 15
        @field_size = field_size
      end

      def create storage
        parsed_list = storage.data
        buckets = parsed_list[0].length
        columns = parsed_list.length

        # image size
        x = columns*@field_size
        y = buckets*@field_size

        # start drawing the damn thing
        loadImg = Magick::Image.new(x, y) { self.background_color = "white" }

        i = 0
        parsed_list.each do |point|
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
            core.draw loadImg
            j = j + 1
          end
          i = i + 1
        end

        loadImg.display
      end


    end

  end
end
