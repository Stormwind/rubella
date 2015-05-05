require "rubella/weighting/base"

module Rubella
  module Weighting

    # The Rubella::Weighting::PerValue object weights every bucket set to 1 in
    # amount. So if you have have for example four cores, every core is
    # weighted to 0.25 no matter how much the load of a single core is. It's
    # just a "as is" weighting.
    #
    class PerValue < Base

      # Creates a output readable list.
      # This list is Array within a subarrays, which contain the buckets for
      # every time value unit.
      #
      # @param input Rubella::Input An input object
      # @return Rubella::Storage
      def parse input
        # prepare data
        data_list = Array.new()

        input.each do |cores|
          # every 10 load percent one heatpoint
          i = 0
          data_list << Array.new(buckets) do
            current_cores = cores.select do |core|
              core >= i and
                ((core < (i+@steps)) or (core <= (i+@steps) and i+@steps == 100))
            end
            amount = current_cores.length
            i      = i + @steps
            amount.to_f/cores.length
          end
        end

        Rubella::Storage.new data_list
      end
      
    end

  end
end
