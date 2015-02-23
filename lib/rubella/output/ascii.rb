module Rubella
  module Output

    class ASCII
      attr_accessor :symbols
      attr_reader   :used_symbols

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

        @field_size   = field_size
        self.used_symbols = "shades_ascii"
      end

      def used_symbols= value
        if @symbols.has_key? value
          @used_symbols = value
          return
        end
        raise ArgumentError, "Symbol set not found, must be one of: " +
          @symbols.keys.join(", ")
      end

      def create storage
        parsed_list = storage.data
        buckets = parsed_list[0].length
        columns = parsed_list.length

        # image size
        x = columns*@field_size
        y = buckets*@field_size

        # start drawing the damn thing
        ascii_arr = [] 
        0.upto(buckets).each { |i| ascii_arr[i] = "" }

        parsed_list.each do |point|
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

        ascii_arr.join("\n")
      end
    end

  end
end