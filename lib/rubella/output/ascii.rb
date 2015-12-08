require "rubella/output/base"

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
    class ASCII < Base
      attr_accessor :symbols
      attr_reader   :used_symbols

      # Constructor
      # Sets the default field_size to 1.
      # Also sets the used ascii art theme to "shades_ascii". See the
      # used_symbols= for further information.
      #
      # @param data Rubella::Storage
      # @param field_size int Used chars for one value
      # @return Rubella::Output::ASCII
      #
      def initialize data, field_size = 1
        @symbols = Hash.new
        @symbols["shades"]       = 
                  [" ", "░", "▒", "▓", "█"]
        @symbols["shades_ascii"] =
                  [" ", "·", "⚬", "∞", "@", "#", "░", "▒", "▓", "█"]
        @symbols["ascii"]        =
                  [" ", "·", ",", ";", "o", "O", "%", "8", "@", "#"]
        @symbols["numbers"]      =
                  [" ", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        @symbols["letters"]      =
                  [" ", "a", "b", "c", "d", "e", "f", "g", "h",
                   "i", "j", "k", "l", "m", "n", "o", "p", "q",
                   "r", "s", "t", "u", "v", "w", "x", "y", "z"]

        self.used_symbols = "shades_ascii"
        super data, field_size
      end

      # Sets the used ascii theme by the given name.
      # The theme must exist. You can also choose your custom theme here.
      # The at default avaliable themes are:
      #   * shades
      #   * shades_ascii
      #   * ascii
      #   * numbers
      #   * letters
      #
      # @param value String The theme name
      # @raise ArgumentError
      #
      def used_symbols= value
        if @symbols.has_key? value
          @used_symbols = value
          return
        end
        raise ArgumentError, "Symbol set not found, must be one of: " +
          @symbols.keys.join(", ")
      end

      # Creates an ascii art representation.
      #
      # @return String
      #
      def render
        buckets = @data.dataset_length
        # columns = @data.length

        # image size
        # x = columns*@field_size
        # y = buckets*@field_size

        # start drawing the damn thing
        ascii_arr = [] 
        0.upto(buckets-1).each { |i| ascii_arr[i] = "" }

        @data.each do |point|
          i = 0
          point.reverse.each do |part|
            part = (part*@symbols[@used_symbols].length).to_i

            # Fix to prevent possible overflow.. should never happen, but we
            # are careful
            if part > (@symbols[@used_symbols].length-1)
              part = (@symbols[@used_symbols].length-1)
            end

            ascii_arr[i] << @symbols[@used_symbols][part]
            i = i+1
          end
        end

        ascii_arr.join("\n")
      end
    end

  end
end
