module Rubella
  module Weighting


    # The Rubella::Weighting object processes the given input data to an valid
    # output processable Array. 
    # These arrays contain a subarray for every unit of time. And these Array
    # contain the buckets within the values for the output objects.
    # The Weighting of the print intensitiy is done here, so that the output
    # objects job is simply to print the stuff.
    #
    class Base
      attr_reader :buckets
      # :steps

      # Constructor
      # Creates a new Rubella::Weighting::xy object.
      #
      # @param buckets int must be one of 1, 2, 5, 10, 20, 50 default is 10
      # @return Rubella::Weighting::Base
      # @raise ArgumentError
      #
      def initialize(buckets = 10)
        self.buckets = buckets
      end

      # Sets the buckets, if the value is valid
      #
      # @param buckets int The amount of buckets
      # @raise ArgumentError
      #
      def buckets= buckets
        # Must be divideable by 100
        if([1, 2, 5, 10, 20, 50].index(buckets) == nil)
          raise ArgumentError.new "Amount of buckets must be 1, 2, 5, 10, 20 "+
            "or 50"
        end
        
        @steps   = 100/buckets
        @buckets = buckets
      end

      # Creates a output readable list.
      # This list is Array within a subarrays, which contain the buckets for
      # every time value unit.
      #
      # @param input Rubella::Input An input object
      # @return Rubella::Storage
      #
      def parse input
        raise NotImplementedError.new "Please override 'parse' in your "+
          "concrete implementation"
      end

    end

  end
end
