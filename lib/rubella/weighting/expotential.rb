require "rubella/weighting/base"

module Rubella
  module Weighting

    # The Rubella::Weighting::Expotential object weights every bucket per
    # amount of cores. But the cores with higher load get a visualisation
    # boost, which is expotential. So one high load core, will have much more
    # color, than serveral less load cores.
    #
    class Expotential < Base

      # Creates a output readable list.
      # This list is Array within a subarrays, which contain the buckets for
      # every time value unit.
      #
      # @param input Rubella::Input An input object
      # @return Rubella::Storage
      def parse input
        # prepare data
        data_list    = Array.new()
        bucket_no    = 0
        total_amount = nil

        input.each do |cores|
          total_amount = cores.length if total_amount.nil?
          # every 10 load percent one heatpoint
          i = 0
          data_list << Array.new(buckets) do
            amount    = cores.select { |core| core >= i and core < (i+@steps)}.length
            i         = i + @steps
            core      = (amount.to_f*bucket_no**0.8)/total_amount
            bucket_no = bucket_no + 1

            core
          end
        end

        Rubella::Storage.new data_list
      end

    end

  end
end
