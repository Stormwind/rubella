module Rubella
  module Output

    class ASCII
      SHADE_0 = " "
      SHADE_1 = "·"
      SHADE_2 = "⚬"
      SHADE_3 = "∞"
      SHADE_4 = "@"
      SHADE_5 = "#"
      SHADE_6 = "░"
      SHADE_7 = "▒"
      SHADE_8 = "▓"
      SHADE_9 = "█"


      def initialize field_size = 1
        @field_size = field_size
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
                ascii_arr[i] << SHADE_0
              when 11..20 then
                ascii_arr[i] << SHADE_1
              when 21..30 then
                ascii_arr[i] << SHADE_2
              when 31..40 then
                ascii_arr[i] << SHADE_3
              when 41..50 then
                ascii_arr[i] << SHADE_4
              when 51..60 then
                ascii_arr[i] << SHADE_5
              when 61..70 then
                ascii_arr[i] << SHADE_6
              when 71..80 then
                ascii_arr[i] << SHADE_7
              when 81..90 then
                ascii_arr[i] << SHADE_8
              else
                ascii_arr[i] << SHADE_9
            end
            i = i+1
          end
        end

        ascii_arr.join("\n")
      end

    end

  end
end