require "rubella/weighting/base"

module Rubella
  module Weighting

    # The Rubella::Weighting::PerValue object weights every bucket set to 1 in
    # ammount. So if you have have for example four cores, every core is
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
        data = input.data
        # no data, no work
        return [] if data.length == 0

        # total amount of cores
        total_amount = data[0].length

        # prepare data
        data_list = Array.new()

        data.each do |cores|
          # every 10 load percent one heatpoint
          i = 0
          data_list << Array.new(buckets) do
            amount = cores.select { |core| core >= i and core < (i+@steps)}.length
            i = i + @steps
            amount.to_f/total_amount
          end
        end

        Rubella::Storage.new data_list
      end
      
    end

  end
end
