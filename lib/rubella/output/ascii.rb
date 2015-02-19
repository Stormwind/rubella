module Rubella
  module Output

    class ASCII
      SHADE_0 = " "
      SHADE_1 = "░"
      SHADE_2 = "▒"
      SHADE_3 = "▓"
      SHADE_4 = "█"

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
              when 0..20 then
                ascii_arr[i] << SHADE_0
              when 21..40 then
                ascii_arr[i] << SHADE_1
              when 41..60 then
                ascii_arr[i] << SHADE_2
              when 61..80 then
                ascii_arr[i] << SHADE_3
              else
                ascii_arr[i] << SHADE_4
            end
            i = i+1
          end
        end

        ascii_arr.join("\n")
      end

    end

  end
end