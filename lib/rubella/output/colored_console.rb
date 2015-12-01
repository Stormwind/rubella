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
        @symbols["colored_fields"] = Array.new(10) do |i|
          color = case i
            when 0 then 35+196
            when 1 then 29+196
            when 2 then 23+196
            when 3 then 17+196
            when 4 then 11+196
            when 5 then 5+196
            when 6 then 196
            when 7 then 160
            when 8 then 124
            when 9 then 88
          end

          "\033[38;5;"+color.to_s+";48;5;"+color.to_s+"m█\033[m"
        end

        self.used_symbols = "colored_fields"
      end


    end

  end
end