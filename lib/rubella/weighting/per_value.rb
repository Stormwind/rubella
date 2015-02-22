module Rubella
  module Weighting

    # The Rubella::Weighting object processes the given input data to an valid
    # output processable Array. 
    # These arrays contain a subarray for every unit of time. And these Array
    # contain the buckets within the values for the output objects.
    # The Weighting of the print intensitiy is done here, so that the output
    # objects job is simply to print the stuff.
    #
    # The Rubella::Weighting::PerValue object weights every bucket set to 1 in
    # ammount. So if you have have for example four cores, every core is
    # weighted to 0.25 no matter how much the load of a single core is. It's
    # just a "as is" weighting.
    class PerValue
      attr_reader :buckets
      # :steps

      # Constructor
      # Creates a new Rubella::Weighting::PerValue object.
      #
      # @param buckets int must be one of 1, 2, 5, 10, 20, 50 default is 10
      # @return Rubella::Weighting::PerValue
      # @raise ArgumentError
      def initialize(buckets = 10)
        self.buckets = buckets
      end

      # Creates a output readable list.
      # This list is Array within a subarrays, which contain the buckets for
      # every time value unit.
      #
      # @param input Rubella::Input An input object
      # @return Array
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
      
      # Sets the buckets, if the value is valid
      #
      # @param buckets int The amount of buckets
      # @raise ArgumentError
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
