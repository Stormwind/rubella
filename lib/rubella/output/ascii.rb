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
      # @param field_size int Used chars for one value
      # @return Rubella::Output::ASCII
      #
      def initialize field_size = 1
        @symbols = Hash.new
        @symbols["shades"]       = 
                  [" ", " ", "░", "░", "▒", "▒", "▓", "▓", "█", "█"]
        @symbols["shades_ascii"] =
                  [" ", "·", "⚬", "∞", "@", "#", "░", "▒", "▓", "█"]
        @symbols["ascii"]       =
                  [" ", "·", ",", ";", "o", "O", "%", "8", "@", "#"]
        @symbols["numbers"] =
                  [" ", "1", "2", "3", "4", "5", "6", "7", "8", "9"]

        self.used_symbols = "shades_ascii"
        super field_size
      end

      # Sets the used ascii theme by the given name.
      # The theme must exist. You can also choose your custom theme here.
      # The at default avaliable themes are:
      #   * shades
      #   * shades_ascii
      #   * ascii
      #   * numbers
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

      # Creates an ascii art representation of the given storage data.
      #
      # @param storage Rubella::Storage
      # @return Rubella::Storage::ASCII
      #
      def create storage
        buckets = storage.data[0].length
        # columns = storage.data.length

        # image size
        # x = columns*@field_size
        # y = buckets*@field_size

        # start drawing the damn thing
        ascii_arr = [] 
        0.upto(buckets-1).each { |i| ascii_arr[i] = "" }

        storage.data.each do |point|
          i = 0
          point.reverse.each do |part|
            part = (part*10).to_i       

            # Fix to prevent possible overflow.. should never happen, but we
            # are careful
            if part > 9
              part = 9
            end

            ascii_arr[i] << @symbols[@used_symbols][part]
            i = i+1
          end
        end

        @data = ascii_arr.join("\n")
        self
      end
    end

  end
end