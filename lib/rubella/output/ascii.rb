module Rubella
  module Output

    class ASCII

      def initialize field_size = 1
        @symbols = Hash.new
        #@symbols["shades"] =
        @symbols["shades_ascii"] =
                            [" ", "·", "⚬", "∞", "@", "#", "░", "▒", "▓", "█"]
        #@symbols["ascii"]   =
        #@symbols["numbers"] =

        @field_size   = field_size
        @used_symbols = "shades_ascii"
      end

      def create parsed_list
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