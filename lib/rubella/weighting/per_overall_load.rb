require "rubella/weighting/base"

module Rubella
  module Weighting

    # The Rubella::Weighting::PerOverallValue object summarizes the load of all
    # cores in a time and computes how much load is one percent. Then it uses
    # this as factor to weight the summarized load of every bucket.
    # So your representation will show you the higher load cores more
    # intensive, then the cores with lower load, depending on the current load.
    #
    class PerOverallLoad < Base

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

        # prepare data
        data_list = Array.new()

        data.each do |cores|

          # Add all loads to compute how much % is one % load
          load_sum = 0
          cores.each { |core| load_sum = load_sum + core }
          percent_load = 100.0/load_sum

          # every 10 load percent one heatpoint
          i = 0
          data_list << Array.new(buckets) do
            # Select all current cores
            selected_cores = cores.select { |core| core >= i and core < (i+@steps)}
            i = i + @steps

            # add the load of the resulting cores and multiply it with the overall value
            load_sum = 0
            selected_cores.each { |core| load_sum = load_sum + core }
            (load_sum.to_f*percent_load)/100
          end
        end

        Rubella::Storage.new data_list
      end

    end

  end
end
