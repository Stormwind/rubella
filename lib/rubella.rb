module Rubella

  class Map

    def initialize(input, output, weighting)

      case input
        when "json" then
          self.input_json
        else
          raise NotImplementedError, "Not supported input type "+input+" given"
      end

      case output
        when "image" then
          self.output_image
        else
          raise NotImplementedError, "Not supported output type "+output+" given"
      end

      case weighting
        when "per_value" then
          self.weighting_per_value
        when "per_overall_load" then
          self.weighting_per_overall_load
        when "expotential" then
          self.weighting_expotential
        else
          raise NotImplementedError, "Not supported weighting type "+weighting+" given"
      end
      
    end

    def input_json
      require "rubella/input/json"
    end

    def output_image
      require "rubella/output/image"
    end

    def weighting_per_value
      require "rubella/weighting/per_value"
    end

    def weighting_per_overall_load
      require "rubella/weighting/per_overall_load"
    end

    def weighting_expotential
      require "rubella/weighting/expotential"
    end

  end
end