require "rubella/output/ascii"

module Rubella
  module Output

    # Creates a ascii art representation of the given storage data.
    # In @data will a ordenary String be stored. Print the String to your
    # output field and it will shows a nice ascii art graphic.
    # There are also different ascii art themes available. Including the
    # possibility to add own themes.
    # You only need to push an Array within 10 chars for the representation
    # into the :symbols Hash. Then you can select it with set the used_symbols
    # variable to you theme name.
    #
    # TODO Use setted field_size for representation
    #
    class ColoredConsole < ASCII

      # Constructor
      # Sets the default field_size to 1.
      # Also sets the used ascii art theme to "shades_ascii". See the
      # used_symbols= for further information.
      #
      # @param data Rubella::Storage
      # @param field_size int Used chars for one value
      # @return Rubella::Output::ColoredConsole
      #
      def initialize data, field_size = 1
        super data, field_size

        @symbols = Hash.new
        @symbols["greyscale"] = self.create_colors [
          232, 233, 234, 235, 236, 237, 238, 239,
          240, 241, 242, 243, 244, 245, 246, 247,
          248, 249, 250, 251, 252, 253, 254, 255
        ]
        @symbols["green_to_red"] = self.create_colors [
          231, # white
          194, 157, 120, 83, 46, 40, 76, 113, 149, 185, # green
          230, 230, # yellow (mean)
          114, 208, 202, # orange
          196, 196, 160, 160, 124, 88, 52  #red
        ]
        @symbols["colored_fields"] = self.create_colors [
            35+196,
            24+196,
            18+196,
            12+196,
            6+196,
            196,
            160,
            124,
            88,
            52
          ]

        self.used_symbols = "colored_fields"
      end

      # Gets a string of 8-bit color codes and translates them into color
      # commands for the shell.
      #
      # @param codes Array
      # @return Array
      #
      def create_colors codes
        colors = []
        codes.each do |code|
          colors << "\033[38;5;"+code.to_s+";48;5;"+code.to_s+"m█\033[m"
        end

        colors
      end

    end
  end
end
