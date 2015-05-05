require "rubella/weighting/base"

module Rubella
  module Weighting

    # The Rubella::Weighting::PerCount create a field of each given value.
    # The weighting is based on the maximum value.
    #
    class PerCount < Base

      # Constructor
      # Creates a new Rubella::Weighting::PerCount object.
      #
      # @param buckets int
      # @return Rubella::Weighting::Base
      # @raise ArgumentError
      #
      def initialize buckets = 7
        super buckets
      end

      # Sets the buckets
      #
      # @param buckets int The amount of buckets
      # @raise ArgumentError
      #
      def buckets= buckets
        @buckets = buckets
      end

      # Creates a output readable list.
      # This list is Array within a subarrays, which contain the buckets for
      # every time value unit.
      #
      # @param input Rubella::Input An input object
      # @return Rubella::Storage
      def parse input
        # prepare data
        data_list = Array.new()

        # Get the maximum of commits
        max = input.sort.pop

        i = 0
        input.each do |commits|
          data_list << Array.new() if i == 0
          data_list.last << commits.to_f/max
          if i == (buckets-1)
            i = 0
          else
            i = i + 1
          end
        end

        Rubella::Storage.new data_list
      end
      
    end

  end
end
