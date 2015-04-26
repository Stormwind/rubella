module Rubella
  module Input

    # Gets the raw data and translate it into a readable format for the
    # Rubella::Weighting::Base class.
    # This must be an array within subarrays, which have all the same lenght
    # and contains only numeric data.
    #
    class Base
      attr_reader :data

      # Passes each dataset trought the given block.
      #
      # @param pointer to block
      #
      def each &block
        @data.each &block
      end

    end

  end
end
