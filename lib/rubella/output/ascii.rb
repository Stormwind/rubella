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
            part = (part*100).to_i          

            case part
              when  0..10 then
                ascii_arr[i] << @symbols[@used_symbols][0]
              when 11..20 then
                ascii_arr[i] << @symbols[@used_symbols][1]
              when 21..30 then
                ascii_arr[i] << @symbols[@used_symbols][2]
              when 31..40 then
                ascii_arr[i] << @symbols[@used_symbols][3]
              when 41..50 then
                ascii_arr[i] << @symbols[@used_symbols][4]
              when 51..60 then
                ascii_arr[i] << @symbols[@used_symbols][5]
              when 61..70 then
                ascii_arr[i] << @symbols[@used_symbols][6]
              when 71..80 then
                ascii_arr[i] << @symbols[@used_symbols][7]
              when 81..90 then
                ascii_arr[i] << @symbols[@used_symbols][8]
              else
                ascii_arr[i] << @symbols[@used_symbols][9]
            end
            i = i+1
          end
        end

        ascii_arr.join("\n")
      end

    end

  end
end