module Rubella

  class Map
    attr_reader :input
    attr_reader :output
    attr_reader :weighting

    def initialize(input_name, output_name, weighting_name)

      @input = case input_name
        when "json" then
          self.input_json
        else
          raise NotImplementedError, "Not supported input type "+input_name+" given"
      end

      @output = case output_name
        when "image" then
          self.output_image
        else
          raise NotImplementedError, "Not supported output type "+output_name+" given"
      end

      @weighting = case weighting_name
        when "per_value" then
          self.weighting_per_value
        when "per_overall_load" then
          self.weighting_per_overall_load
        when "expotential" then
          self.weighting_expotential
        else
          raise NotImplementedError, "Not supported weighting type "+weighting_name+" given"
      end

    end

    def input_json
      require "rubella/input/json"
      Input::JSON
    end

    def output_image
      require "rubella/output/image"
      Output::Image
    end

    def weighting_per_value
      require "rubella/weighting/per_value"
      Weighting::PerValue
    end

    def weighting_per_overall_load
      require "rubella/weighting/per_overall_load"
      Weighting::PerOverallLoad
    end

    def weighting_expotential
      require "rubella/weighting/expotential"
      Weighting::Expotential
    end

  end
end