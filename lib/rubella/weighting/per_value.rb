module Rubella
  module Weighting

    # Gets an input object and prepares the data for the output.
    class PerValue
      attr_reader :buckets
      # : steps


      # buckets must be one of 1, 2, 5, 10, 20, 50 default is 10
      def initialize(buckets = 10)
        self.buckets = buckets
      end

      def parse input
        data = input.data
        # no data, no work
        return [] if data.length == 0

        # total amount of cores
        total_amount = data[0].length
        # TODO check somewhere, if every dataset has the same amount of cores

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

        data_list
      end
      
      def buckets= buckets
        # Must be divideable by 100
        if([1, 2, 5, 10, 20, 50].index(buckets) == nil)
          raise ArgumentError, "Amount of buckets must be 1, 2, 5, 10, 20 or 50"
        end
        
        @steps   = 100/buckets
        @buckets = buckets
      end

    end

  end
end
